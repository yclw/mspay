// Package common
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2023 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
package common

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/yclw/mspay/internal/model/input/adminin"
)

// LoginLogoutReq 注销登录
type LoginLogoutReq struct {
	g.Meta `path:"/site/logout" method:"post" tags:"后台基础" summary:"注销登录"`
}

type LoginLogoutRes struct{}

// RegisterReq 提交账号注册
type RegisterReq struct {
	g.Meta `path:"/site/register" method:"post" tags:"后台基础" summary:"账号注册"`
	adminin.RegisterInp
}

type RegisterRes struct {
	*adminin.LoginModel
}

// LoginCaptchaReq 获取登录验证码
type LoginCaptchaReq struct {
	g.Meta `path:"/site/captcha" method:"get" tags:"后台基础" summary:"获取登录验证码"`
}

type LoginCaptchaRes struct {
	Cid    string `json:"cid" dc:"验证码ID"`
	Base64 string `json:"base64" dc:"验证码"`
}

// AccountLoginReq 提交账号登录
type AccountLoginReq struct {
	g.Meta `path:"/site/accountLogin" method:"post" tags:"后台基础" summary:"账号登录"`
	adminin.AccountLoginInp
}

type AccountLoginRes struct {
	*adminin.LoginModel
}

// MobileLoginReq 提交手机号登录
type MobileLoginReq struct {
	g.Meta `path:"/site/mobileLogin" method:"post" tags:"后台基础" summary:"手机号登录"`
	adminin.MobileLoginInp
}

type MobileLoginRes struct {
	*adminin.LoginModel
}

// SiteConfigReq 获取配置
type SiteConfigReq struct {
	g.Meta `path:"/site/config" method:"get" tags:"后台基础" summary:"获取配置"`
}

type SiteConfigRes struct {
	Version string `json:"version"        dc:"系统版本"`
	WsAddr  string `json:"wsAddr"         dc:"客户端websocket地址"`
	Domain  string `json:"domain"         dc:"对外域名"`
	Mode    string `json:"mode"           dc:"运行模式"`
}

// SiteLoginConfigReq 获取登录配置
type SiteLoginConfigReq struct {
	g.Meta `path:"/site/loginConfig" method:"get" tags:"后台基础" summary:"获取登录配置"`
}

type SiteLoginConfigRes struct {
	*adminin.LoginConfig
}

// SitePingReq ping
type SitePingReq struct {
	g.Meta `path:"/site/ping" method:"get" tags:"后台基础" summary:"ping"`
}

type SitePingRes struct{}

// LoginConfig 登录配置
type LoginConfig struct {
	RegisterSwitch int     `json:"loginRegisterSwitch"` // 注册开关
	CaptchaSwitch  int     `json:"loginCaptchaSwitch"`  // 验证码开关
	CaptchaType    int     `json:"loginCaptchaType"`    // 验证码类型
	Avatar         string  `json:"loginAvatar"`         // 头像
	RoleId         int64   `json:"loginRoleId"`         // 角色ID
	DeptId         int64   `json:"loginDeptId"`         // 部门ID
	PostIds        []int64 `json:"loginPostIds"`        // 岗位ID
	Protocol       string  `json:"loginProtocol"`       // 协议
	Policy         string  `json:"loginPolicy"`         // 政策
	AutoOpenId     int     `json:"loginAutoOpenId"`     // 自动OpenId
	ForceInvite    int     `json:"loginForceInvite"`    // 强制邀请
}
