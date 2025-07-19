package login

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/yclw/mspay/internal/model/input/loginin"
)

// PingReq ping
type PingReq struct {
	g.Meta `path:"/login/ping" method:"get" tags:"登录" summary:"ping"`
}

type PingRes struct{}

// LoginCaptchaReq 获取登录验证码
type LoginCaptchaReq struct {
	g.Meta `path:"/login/captcha" method:"get" tags:"登录" summary:"获取登录验证码"`
}

type LoginCaptchaRes struct {
	Cid    string `json:"cid" dc:"验证码ID"`
	Base64 string `json:"base64" dc:"验证码"`
}

// AccountLoginReq 提交账号登录
type AccountLoginReq struct {
	g.Meta `path:"/login/accountLogin" method:"post" tags:"登录" summary:"账号登录"`
	loginin.AccountLoginInp
}

type AccountLoginRes struct {
	*loginin.LoginModel
}

// LoginLogoutReq 注销登录
type LoginLogoutReq struct {
	g.Meta `path:"/login/logout" method:"post" tags:"登录" summary:"注销登录"`
}

type LoginLogoutRes struct{}
