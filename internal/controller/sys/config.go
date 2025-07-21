package sys

import (
	"context"

	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gmode"
	api "github.com/yclw/mspay/api/config"
	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/internal/model/input/form"
	service "github.com/yclw/mspay/internal/service/sys"
	"github.com/yclw/mspay/util/validate"
)

var Config = cConfig{}

var (
	SysConfigService = service.SSysConfig
)

type cConfig struct{}

// GetConfig 获取指定分组的配置
func (c *cConfig) GetConfig(ctx context.Context, req *api.GetReq) (res *api.GetRes, err error) {
	res = new(api.GetRes)
	res.GetConfigModel, err = SysConfigService.GetConfigByGroup(ctx, &req.GetConfigInp)
	return
}

// UpdateConfig 更新指定分组的配置
func (c *cConfig) UpdateConfig(ctx context.Context, req *api.UpdateReq) (res *api.UpdateRes, err error) {
	err = SysConfigService.UpdateConfigByGroup(ctx, &req.UpdateConfigInp)
	return
}

// TypeSelect 数据类型选项
func (c *cConfig) TypeSelect(_ context.Context, _ *api.TypeSelectReq) (res api.TypeSelectRes, err error) {
	for _, v := range consts.ConfigTypes {
		res = append(res, form.Select{
			Value: v,
			Name:  v,
			Label: v,
		})
	}
	return
}

// LoginConfig 登录配置
func (c *cConfig) LoginConfig(ctx context.Context, _ *api.LoginConfigReq) (res *api.LoginConfigRes, err error) {
	res = new(api.LoginConfigRes)
	login, err := SysConfigService.GetLogin(ctx)
	if err != nil {
		return
	}
	res.LoginConfig = login
	return
}

// Config 获取配置
func (c *cConfig) SiteConfig(ctx context.Context, _ *api.SiteConfigReq) (res *api.SiteConfigRes, err error) {
	request := ghttp.RequestFromCtx(ctx)
	res = &api.SiteConfigRes{
		Version: consts.VersionApp,
		WsAddr:  c.getWsAddr(ctx, request),
		Domain:  c.getDomain(ctx, request),
		Mode:    gmode.Mode(),
	}
	return
}

// getWsAddr 获取websocket地址
func (c *cConfig) getWsAddr(ctx context.Context, request *ghttp.Request) string {
	// 如果是本地IP访问，则认为是调试模式，走实际请求地址，否则走配置中的地址
	// 尝试读取hostname，兼容本地运行模式
	ip := ghttp.RequestFromCtx(ctx).GetHeader("hostname")
	if len(ip) == 0 {
		ip = ghttp.RequestFromCtx(ctx).GetHost()
	}

	if validate.IsLocalIPAddr(ip) {
		return "ws://" + ip + ":" + gstr.StrEx(request.Host, ":") + g.Cfg().MustGet(ctx, "router.websocket.prefix").String()
	}

	basic, err := SysConfigService.GetBasic(ctx)
	if err != nil || basic == nil {
		return ""
	}
	return basic.WsAddr
}

// getDomain 获取域名
func (c *cConfig) getDomain(ctx context.Context, request *ghttp.Request) string {
	// 如果是本地IP访问，则认为是调试模式，走实际请求地址，否则走配置中的地址
	// 尝试读取hostname，兼容本地运行模式
	ip := ghttp.RequestFromCtx(ctx).GetHeader("hostname")
	if len(ip) == 0 {
		ip = ghttp.RequestFromCtx(ctx).GetHost()
	}

	if validate.IsLocalIPAddr(ip) {
		return "http://" + ip + ":" + gstr.StrEx(request.Host, ":")
	}

	basic, err := SysConfigService.GetBasic(ctx)
	if err != nil || basic == nil {
		return ""
	}
	return basic.Domain
}
