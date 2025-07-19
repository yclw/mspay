package config

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/yclw/mspay/internal/model/input/sysin"
)

// SiteConfigReq 获取配置
type ConfigReq struct {
	g.Meta `path:"/config" method:"get" tags:"后台基础" summary:"获取配置"`
}

type ConfigRes struct {
	Version string `json:"version"        dc:"系统版本"`
	WsAddr  string `json:"wsAddr"         dc:"客户端websocket地址"`
	Domain  string `json:"domain"         dc:"对外域名"`
	Mode    string `json:"mode"           dc:"运行模式"`
}

// LoginConfigReq 获取登录配置
type LoginConfigReq struct {
	g.Meta `path:"/config/loginConfig" method:"get" tags:"登录" summary:"获取登录配置"`
}

type LoginConfigRes struct {
	*sysin.LoginConfig
}
