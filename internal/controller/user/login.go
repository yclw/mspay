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
)

var Login = cLogin{}

// 依赖
var (
	LoginService  = service.SUserLogin
	ConfigService = sys.SSysConfig
)

type cLogin struct{}

// Ping ping
func (c *cLogin) Ping(_ context.Context, _ *api.PingReq) (res *api.PingRes, err error) {
	return
}

// Captcha 登录验证码
func (c *cLogin) Captcha(ctx context.Context, _ *api.LoginCaptchaReq) (res *api.LoginCaptchaRes, err error) {
	loginConf, err := ConfigService.GetLogin(ctx)
	if err != nil {
		return
	}
	cid, base64 := captcha.Generate(ctx, loginConf.CaptchaType)
	res = &api.LoginCaptchaRes{Cid: cid, Base64: base64}
	return
}

// AccountLogin 账号登录
func (c *cLogin) AccountLogin(ctx context.Context, req *api.AccountLoginReq) (res *api.AccountLoginRes, err error) {
	// 获取登录配置
	config, err := ConfigService.GetLogin(ctx)
	if err != nil {
		return
	}

	// 校验验证码
	if !req.IsLock && config.CaptchaSwitch == consts.StatusEnabled && !captcha.Verify(req.Cid, req.Code) {
		err = gerror.New("验证码错误")
		return
	}

	// 账号登录
	model, err := LoginService.AccountLogin(ctx, &req.AccountLoginInp)
	if err != nil {
		return
	}

	res = new(api.AccountLoginRes)
	res.Id = model.Id
	res.Username = model.Username
	res.Token = model.Token
	res.Expires = model.Expires

	return
}

// Logout 注销登录
func (c *cLogin) Logout(ctx context.Context, _ *api.LoginLogoutReq) (res *api.LoginLogoutRes, err error) {
	err = token.Logout(ghttp.RequestFromCtx(ctx))
	return
}
