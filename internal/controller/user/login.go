package user

import (
	"context"

	api "github.com/yclw/mspay/api/login"
	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/internal/service/sys"
	service "github.com/yclw/mspay/internal/service/user"
	"github.com/yclw/mspay/pkg/token"
	"github.com/yclw/mspay/util/captcha"

	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/util/gconv"
)

var Login = cLogin{}

type cLogin struct{}

// Ping ping
func (c *cLogin) Ping(_ context.Context, _ *api.PingReq) (res *api.PingRes, err error) {
	return
}

// LoginConfig 登录配置
func (c *cLogin) LoginConfig(ctx context.Context, _ *api.LoginConfigReq) (res *api.LoginConfigRes, err error) {
	res = new(api.LoginConfigRes)
	login, err := sys.SSysConfig.GetLogin(ctx)
	if err != nil {
		return
	}
	res.LoginConfig = login
	return
}

// Captcha 登录验证码
func (c *cLogin) Captcha(ctx context.Context, _ *api.LoginCaptchaReq) (res *api.LoginCaptchaRes, err error) {
	loginConf, err := sys.SSysConfig.GetLogin(ctx)
	if err != nil {
		return
	}
	cid, base64 := captcha.Generate(ctx, loginConf.CaptchaType)
	res = &api.LoginCaptchaRes{Cid: cid, Base64: base64}
	return
}

// AccountLogin 账号登录
func (c *cLogin) AccountLogin(ctx context.Context, req *api.AccountLoginReq) (res *api.AccountLoginRes, err error) {
	login, err := sys.SSysConfig.GetLogin(ctx)
	if err != nil {
		return
	}

	if !req.IsLock && login.CaptchaSwitch == consts.StatusEnabled {
		// 校验 验证码
		if !captcha.Verify(req.Cid, req.Code) {
			err = gerror.New("验证码错误")
			return
		}
	}

	model, err := service.SUserLogin.AccountLogin(ctx, &req.AccountLoginInp)
	if err != nil {
		return
	}

	err = gconv.Scan(model, &res)
	return
}

// Logout 注销登录
func (c *cLogin) Logout(ctx context.Context, _ *api.LoginLogoutReq) (res *api.LoginLogoutRes, err error) {
	err = token.Logout(ghttp.RequestFromCtx(ctx))
	return
}
