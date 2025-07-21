package config

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/yclw/mspay/internal/model/input/form"
	"github.com/yclw/mspay/internal/model/input/sysin"
)

// GetReq 获取指定分组的配置
type GetReq struct {
	g.Meta `path:"/config/get" method:"get" tags:"配置" summary:"获取指定分组的配置"`
	sysin.GetConfigInp
}

type GetRes struct {
	*sysin.GetConfigModel
}

// UpdateReq 更新指定分组的配置
type UpdateReq struct {
	g.Meta `path:"/config/update" method:"post" tags:"配置" summary:"获取指定分组的配置"`
	sysin.UpdateConfigInp
}

type UpdateRes struct {
}

// TypeSelectReq 数据类型选项
type TypeSelectReq struct {
	g.Meta `path:"/config/typeSelect" method:"get" tags:"配置" summary:"数据类型选项"`
}

type TypeSelectRes []form.Select

// SiteConfigReq 获取配置
type SiteConfigReq struct {
	g.Meta `path:"/config/site" method:"get" tags:"后台基础" summary:"获取配置"`
}

type SiteConfigRes struct {
	Version string `json:"version"        dc:"系统版本"`
	WsAddr  string `json:"wsAddr"         dc:"客户端websocket地址"`
	Domain  string `json:"domain"         dc:"对外域名"`
	Mode    string `json:"mode"           dc:"运行模式"`
}

// LoginConfigReq 获取登录配置
type LoginConfigReq struct {
	g.Meta `path:"/config/login" method:"get" tags:"登录" summary:"获取登录配置"`
}

type LoginConfigRes struct {
	*sysin.LoginConfig
}
