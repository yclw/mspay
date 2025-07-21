package user

import (
	"context"

	"github.com/yclw/mspay/internal/dao"
	"github.com/yclw/mspay/internal/model/entity"
	"github.com/yclw/mspay/internal/model/input/commonin"
	"github.com/yclw/mspay/internal/model/input/loginin"
	"github.com/yclw/mspay/internal/model/input/userin"
	"github.com/yclw/mspay/pkg/contexts"
	"github.com/yclw/mspay/pkg/orm"
	"github.com/yclw/mspay/util/tree"

	"github.com/gogf/gf/v2/crypto/gmd5"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/grand"
)

var SUserMember = NewUserMember()

type sUserMember struct{}

func NewUserMember() *sUserMember {
	return &sUserMember{}
}

// MemberInfo 用户信息
func (s *sUserMember) MemberInfo(ctx context.Context) (res *userin.MemberInfoModel, err error) {
	// 获取用户ID
	memberId := contexts.GetUserId(ctx)
	if memberId <= 0 {
		err = gerror.New("用户身份异常，请重新登录！")
		return
	}

	// 获取用户信息
	if err = dao.TMemberInfo.Ctx(ctx).WherePri(memberId).Scan(&res); err != nil {
		err = gerror.Wrap(err, "获取用户信息失败，请稍后重试！")
		return
	}

	if res == nil {
		err = gerror.New("用户不存在！")
		return
	}

	// 登录统计
	stat, err := s.loginStat(ctx, memberId)
	if err != nil {
		return
	}
	res.MemberLoginStatModel = stat // 登录统计

	res.Mobile = gstr.HideStr(res.Mobile, 40, `*`) // 手机号脱敏
	res.Email = gstr.HideStr(res.Email, 40, `*`)   // 邮箱脱敏
	return
}

// loginStat 用户登录统计
func (s *sUserMember) loginStat(ctx context.Context, memberId int64) (res *loginin.MemberLoginStatModel, err error) {
	stat, err := dao.TLogLogin.GetLoginStat(ctx, memberId)
	if err != nil {
		return
	}

	res = new(loginin.MemberLoginStatModel)
	res.LastLoginAt = stat.LoginAt
	res.LastLoginIp = stat.LoginIp
	res.LoginCount, err = dao.TLogLogin.GetLoginCount(ctx, memberId)
	return
}

// Delete 删除用户
func (s *sUserMember) Delete(ctx context.Context, in *userin.MemberDeleteInp) (err error) {

	var list []*entity.TMemberInfo
	mod, err := s.getSubMemberModel(ctx)
	if err != nil {
		return
	}

	if err = mod.WherePri(in.Id).Scan(&list); err != nil {
		err = gerror.Wrap(err, "获取用户信息失败，请稍后重试！")
		return
	}

	if len(list) == 0 {
		err = gerror.New("需要删除的用户不存在或已删除！")
		return
	}

	for _, v := range list {
		// 检查用户是否存在下级用户
		count, err := dao.TMemberInfo.GetSubMemberCount(ctx, v.Id)
		if err != nil {
			err = gerror.Wrap(err, "删除用户检查失败，请稍后重试！")
			return err
		}
		if count > 0 {
			err = gerror.Newf("用户[%v]存在下级，请先删除TA的下级用户！", v.Id)
			return err
		}
	}

	return g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) (err error) {
		mod, err = s.getSubMemberModel(ctx)
		if _, err = mod.WherePri(in.Id).Delete(); err != nil {
			err = gerror.Wrap(err, "删除用户失败，请稍后重试！")
			return
		}

		// 这里如果需要，可以加入更多删除用户的相关处理
		// ...
		return
	})
}

// Edit 修改/新增用户
func (s *sUserMember) Edit(ctx context.Context, in *userin.MemberEditInp) (err error) {

	// 获取当前用户ID
	opMemberId := contexts.GetUserId(ctx)
	if opMemberId <= 0 {
		return
	}

	if in.Username == "" {
		err = gerror.New("帐号不能为空")
		return
	}

	cols := dao.TMemberInfo.Columns()
	err = s.verifyUnique(ctx, &commonin.VerifyUniqueInp{
		Id: in.Id,
		Where: g.Map{
			cols.Username: in.Username,
			cols.Mobile:   in.Mobile,
			cols.Email:    in.Email,
		},
	})
	if err != nil {
		return
	}

	// 验证角色ID
	// if err = service.AdminRole().VerifyRoleId(ctx, in.RoleId); err != nil {
	// 	return
	// }

	// 获取登录配置
	// config, err := service.SysConfig().GetLogin(ctx)
	// if err != nil {
	// 	return
	// }

	// 修改用户
	if in.Id > 0 {

		// 获取子用户信息
		var mod *gdb.Model
		mod, err = s.getSubMemberModel(ctx)
		if err != nil {
			return
		}

		// 修改密码
		if in.Password != "" {
			// 获取到密码盐
			salt, err := mod.Fields(cols.Salt).WherePri(in.Id).Value()
			if err != nil {
				err = gerror.Wrap(err, "获取用户信息失败，请稍后重试！")
				return err
			}
			if salt.IsEmpty() {
				err = gerror.New("该用户没有设置密码盐，请联系管理员！")
				return err
			}
			in.PasswordHash = gmd5.MustEncryptString(in.Password + salt.String())
		} else {
			// 不修改密码，只修改其他字段
			mod = mod.FieldsEx(cols.PasswordHash)
		}

		if _, err = mod.WherePri(in.Id).Data(in).Update(); err != nil {
			err = gerror.Wrap(err, "修改用户信息失败，请稍后重试！")
			return
		}
	}

	// 新增用户
	var data userin.MemberAddInp
	data.MemberEditInp = in
	data.Salt = grand.S(6)
	data.InviteCode = grand.S(12)
	data.PasswordHash = gmd5.MustEncryptString(data.Password + data.Salt)

	// 关系树
	data.Pid = opMemberId
	data.Level, data.Tree, err = s.genTree(ctx, opMemberId)
	if err != nil {
		return
	}

	// 默认头像
	// if data.Avatar == "" {
	// 	data.Avatar = config.Avatar
	// }

	_, err = dao.TMemberInfo.Ctx(ctx).Data(data).OmitEmptyData().Insert()
	if err != nil {
		err = gerror.Wrap(err, "新增用户失败，请稍后重试！")
		return
	}
	return
}

// View 获取用户信息
func (s *sUserMember) View(ctx context.Context, in *userin.MemberViewInp) (res *userin.MemberViewModel, err error) {
	mod, err := s.getSubMemberModel(ctx)
	if err != nil {
		return
	}

	if err = mod.WherePri(in.Id).Scan(&res); err != nil {
		err = gerror.Wrap(err, "获取用户信息失败，请稍后重试！")
	}
	return
}

// List 获取用户列表
func (s *sUserMember) List(ctx context.Context, in *userin.MemberListInp) (list []*userin.MemberListModel, totalCount int, err error) {
	mod, err := s.getSubMemberModel(ctx)
	if err != nil {
		return
	}

	cols := dao.TMemberInfo.Columns()

	if in.RealName != "" {
		mod = mod.WhereLike(cols.RealName, "%"+in.RealName+"%")
	}

	if in.Username != "" {
		mod = mod.WhereLike(cols.Username, "%"+in.Username+"%")
	}

	if in.Mobile > 0 {
		mod = mod.Where(cols.Mobile, in.Mobile)
	}

	if in.Status > 0 {
		mod = mod.Where(cols.Status, in.Status)
	}

	if in.RoleId > 0 {
		mod = mod.Where(cols.RoleId, in.RoleId)
	}

	if in.Id > 0 {
		mod = mod.Where(cols.Id, in.Id)
	}

	if in.Pid > 0 {
		mod = mod.Where(cols.Pid, in.Pid)
	}

	if len(in.CreatedAt) == 2 {
		mod = mod.WhereBetween(cols.CreatedAt, gtime.New(in.CreatedAt[0]), gtime.New(in.CreatedAt[1]))
	}

	if err = mod.Page(in.Page, in.PerPage).OrderDesc(cols.Id).ScanAndCount(&list, &totalCount, true); err != nil {
		err = gerror.Wrap(err, "获取用户列表失败！")
		return
	}

	return
}

// GetSubMemberModel 过滤用户操作权限
// 非超管用户只能操作自己的下级角色用户，并且需要满足自身角色的数据权限设置
func (s *sUserMember) getSubMemberModel(ctx context.Context) (mod *gdb.Model, err error) {
	user := contexts.GetUser(ctx)
	roleId := user.RoleId
	memberId := user.Id

	// 获取下级角色ID
	roleIds, err := dao.TRoleInfo.GetSubRoleIds(ctx, roleId)
	if err != nil {
		return
	}

	// 获取下级角色用户
	mod, err = dao.TMemberInfo.GetMemberByRoleIds(ctx, roleIds)
	if err != nil {
		return
	}

	// 排除当前用户
	mod = mod.Where("id <> ?", memberId)

	return
}

// VerifyUnique 验证管理员唯一属性
func (s *sUserMember) verifyUnique(ctx context.Context, in *commonin.VerifyUniqueInp) (err error) {
	if in.Where == nil {
		return
	}

	cols := dao.TMemberInfo.Columns()
	msgMap := g.MapStrStr{
		cols.Username:   "用户名已存在，请换一个",
		cols.Email:      "邮箱已存在，请换一个",
		cols.Mobile:     "手机号已存在，请换一个",
		cols.InviteCode: "邀请码已存在，请换一个",
	}

	for k, v := range in.Where {
		if v == "" {
			continue
		}
		message, ok := msgMap[k]
		if !ok {
			err = gerror.Newf("字段 [ %v ] 未配置唯一属性验证", k)
			return
		}
		if err = orm.IsUnique(ctx, &dao.TMemberInfo, g.Map{k: v}, message, in.Id); err != nil {
			return
		}
	}
	return
}

// GenTree 生成关系树
func (s *sUserMember) genTree(ctx context.Context, pid int64) (level int, newTree string, err error) {
	var pmb *entity.TMemberInfo
	if err = dao.TMemberInfo.Ctx(ctx).WherePri(pid).Scan(&pmb); err != nil {
		return
	}

	if pmb == nil {
		err = gerror.New("上级信息不存在")
		return
	}

	level = pmb.Level + 1
	newTree = tree.GenLabel(pmb.Tree, pmb.Id)
	return
}
