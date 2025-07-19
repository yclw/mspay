package user

import (
	"context"
	"sync"

	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/internal/dao"
	"github.com/yclw/mspay/internal/model/entity"
	"github.com/yclw/mspay/internal/model/input/loginin"
	"github.com/yclw/mspay/internal/model/input/userin"
	"github.com/yclw/mspay/pkg/contexts"

	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/v2/errors/gerror"
)

var SUserMember = NewUserMember()

type sUserMember struct {
	superAdmin *SuperAdmin
}

// SuperAdmin 超级管理员用户
type SuperAdmin struct {
	sync.RWMutex
	RoleId    int64              // 超管角色ID
	MemberIds map[int64]struct{} // 超管用户ID
}

func NewUserMember() *sUserMember {
	return &sUserMember{
		superAdmin: new(SuperAdmin),
	}
}

// LoginMemberInfo 获取登录用户信息
func (s *sUserMember) LoginMemberInfo(ctx context.Context) (res *userin.LoginMemberInfoModel, err error) {
	// 获取用户ID
	var memberId = contexts.GetUserId(ctx)
	if memberId <= 0 {
		err = gerror.New("用户身份异常，请重新登录！")
		return
	}

	// 获取用户信息
	if err = dao.AdminMember.Ctx(ctx).WherePri(memberId).Scan(&res); err != nil {
		err = gerror.Wrap(err, "获取用户信息失败，请稍后重试！")
		return
	}

	if res == nil {
		err = gerror.New("用户不存在！")
		return
	}

	// TODO：获取用户权限
	// permissions, err := service.AdminMenu().LoginPermissions(ctx, memberId)
	// if err != nil {
	// 	return
	// }
	// res.Permissions = permissions

	// 登录统计
	stat, err := s.MemberLoginStat(ctx, &loginin.MemberLoginStatInp{MemberId: memberId})
	if err != nil {
		return
	}

	res.MemberLoginStatModel = stat                // 登录统计
	res.Mobile = gstr.HideStr(res.Mobile, 40, `*`) // 手机号脱敏
	res.Email = gstr.HideStr(res.Email, 40, `*`)   // 邮箱脱敏
	return
}

// MemberLoginStat 用户登录统计
func (s *sUserMember) MemberLoginStat(ctx context.Context, in *loginin.MemberLoginStatInp) (res *loginin.MemberLoginStatModel, err error) {
	var (
		models *entity.SysLoginLog
		cols   = dao.SysLoginLog.Columns()
	)

	err = dao.SysLoginLog.Ctx(ctx).Fields(cols.LoginAt, cols.LoginIp).
		Where(cols.MemberId, in.MemberId).
		Where(cols.Status, consts.StatusEnabled).
		OrderDesc(cols.Id).
		Scan(&models)

	if err != nil {
		return
	}

	res = new(loginin.MemberLoginStatModel)
	if models == nil {
		return
	}

	res.LastLoginAt = models.LoginAt
	res.LastLoginIp = models.LoginIp
	res.LoginCount, err = dao.SysLoginLog.Ctx(ctx).
		Where(cols.MemberId, in.MemberId).
		Where(cols.Status, consts.StatusEnabled).
		Count()
	return
}
