package user

import (
	"context"

	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/internal/dao"
	"github.com/yclw/mspay/internal/model/entity"
	"github.com/yclw/mspay/internal/model/input/loginin"
	"github.com/yclw/mspay/pkg/contexts"
	"github.com/yclw/mspay/pkg/token"
	"github.com/yclw/mspay/util/simple"

	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/os/gtime"
)

var SUserLogin = NewUserLogin()

type sUserLogin struct{}

func NewUserLogin() *sUserLogin {
	return &sUserLogin{}
}

// AccountLogin 账号登录
func (s *sUserLogin) AccountLogin(ctx context.Context, in *loginin.AccountLoginInp) (res *loginin.LoginModel, err error) {
	// 获取用户信息
	var mb *entity.TMemberInfo
	if mb, err = dao.TMemberInfo.GetMemberByUsername(ctx, in.Username); err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return
	}
	if mb == nil {
		err = gerror.New("用户名或密码错误")
		return
	}

	if mb.Salt == "" {
		err = gerror.New("用户信息错误")
		return
	}

	if err = simple.CheckPassword(in.Password, mb.Salt, mb.PasswordHash); err != nil {
		err = gerror.New("用户名或密码错误")
		return
	}

	if mb.Status != consts.StatusEnabled {
		err = gerror.New("账号已被禁用")
		return
	}

	// 处理登录
	res, err = s.handleLogin(ctx, mb)
	return
}

// handleLogin 处理登录
func (s *sUserLogin) handleLogin(ctx context.Context, mb *entity.TMemberInfo) (res *loginin.LoginModel, err error) {
	role, err := s.getLoginRole(ctx, mb.RoleId)
	if err != nil {
		return nil, err
	}

	// 创建用户身份
	user := &contexts.Identity{
		Id:       mb.Id,
		Pid:      mb.Pid,
		RoleId:   role.Id,
		RoleKey:  role.Key,
		Username: mb.Username,
		RealName: mb.RealName,
		Avatar:   mb.Avatar,
		Email:    mb.Email,
		Mobile:   mb.Mobile,
		App:      consts.AppAdmin,
		LoginAt:  gtime.Now(),
	}

	// 生成登录token
	lt, expires, err := token.Login(ctx, user)
	if err != nil {
		return nil, err
	}

	// 返回登录信息
	res = &loginin.LoginModel{
		Username: user.Username,
		Id:       user.Id,
		Token:    lt,
		Expires:  expires,
	}
	return
}

// getLoginRole 获取登录的角色信息
func (s *sUserLogin) getLoginRole(ctx context.Context, roleId int64) (role *entity.TRoleInfo, err error) {
	role, err = dao.TRoleInfo.GetRoleById(ctx, roleId)
	if err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return
	}

	if role == nil {
		err = gerror.New("角色不存在或已被删除")
		return
	}

	if role.Status != consts.StatusEnabled {
		err = gerror.New("角色已被禁用，如有疑问请联系管理员")
		return
	}

	return
}

// BindUserContext 绑定用户上下文
func (s *sUserLogin) BindUserContext(ctx context.Context, claims *contexts.Identity) (err error) {

	var mb *entity.TMemberInfo
	mb, err = dao.TMemberInfo.GetMemberById(ctx, claims.Id)
	if err != nil {
		err = gerror.Wrap(err, "获取用户信息失败，请稍后重试！")
		return
	}

	if mb == nil {
		err = gerror.Wrap(err, "账号不存在或已被删除！")
		return
	}

	if mb.Status != consts.StatusEnabled {
		err = gerror.New("账号已被禁用，如有疑问请联系管理员")
		return
	}

	role, err := s.getLoginRole(ctx, mb.RoleId)
	if err != nil {
		return err
	}

	user := &contexts.Identity{
		Id:       mb.Id,
		Pid:      mb.Pid,
		RoleId:   mb.RoleId,
		RoleKey:  role.Key,
		Username: mb.Username,
		RealName: mb.RealName,
		Avatar:   mb.Avatar,
		Email:    mb.Email,
		Mobile:   mb.Mobile,
		App:      claims.App,
		LoginAt:  claims.LoginAt,
	}

	contexts.SetUser(ctx, user)
	return
}
