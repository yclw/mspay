package middleware

import (
	"context"
	"fmt"

	"github.com/gogf/gf/v2/errors/gcode"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/internal/service/user"
	"github.com/yclw/mspay/pkg/contexts"
	"github.com/yclw/mspay/pkg/response"
	"github.com/yclw/mspay/pkg/token"
	"github.com/yclw/mspay/util/simple"
	"github.com/yclw/mspay/util/validate"
)

// 依赖
var (
	RoleService = user.SUserRole
)

// Auth 后台鉴权中间件
func (s *cMiddleware) Auth(r *ghttp.Request) {
	var (
		ctx  = r.Context()
		path = gstr.Replace(r.URL.Path, simple.RouterPrefix(ctx, consts.AppAdmin), "", 1)
	)

	// 不需要验证登录的路由地址
	if isExceptLogin(ctx, consts.AppAdmin, path) {
		r.Middleware.Next()
		return
	}

	// 将用户信息传递到上下文中
	if err := deliverUserContext(r); err != nil {
		response.JsonExit(r, gcode.CodeNotAuthorized.Code(), err.Error())
		return
	}

	// 不需要验证权限的路由地址
	if isExceptAuth(ctx, consts.AppAdmin, path) {
		r.Middleware.Next()
		return
	}

	// 验证路由访问权限
	if !RoleService.Verify(ctx, path, r.Method) {
		g.Log().Debugf(ctx, "AdminAuth fail path:%+v, GetRoleKey:%+v, r.Method:%+v", path, contexts.GetRoleKey(ctx), r.Method)
		response.JsonExit(r, gcode.CodeSecurityReason.Code(), "你没有访问权限！")
		return
	}

	r.Middleware.Next()
}

// IsExceptLogin 是否是不需要登录的路由地址
func isExceptLogin(ctx context.Context, appName, path string) bool {
	pathList := g.Cfg().MustGet(ctx, fmt.Sprintf("router.%v.exceptLogin", appName)).Strings()

	for i := 0; i < len(pathList); i++ {
		if validate.InSliceExistStr(pathList[i], path) {
			return true
		}
	}
	return false
}

// IsExceptAuth 是否是不需要验证权限的路由地址
func isExceptAuth(ctx context.Context, appName, path string) bool {
	pathList := g.Cfg().MustGet(ctx, fmt.Sprintf("router.%v.exceptAuth", appName)).Strings()

	for i := 0; i < len(pathList); i++ {
		if validate.InSliceExistStr(pathList[i], path) {
			return true
		}
	}
	return false
}

// deliverUserContext 将用户信息传递到上下文中
func deliverUserContext(r *ghttp.Request) (err error) {
	userInfo, err := token.ParseLoginUser(r)
	if err != nil {
		return
	}

	switch userInfo.App {
	case consts.AppAdmin:
		if err = user.SUserLogin.BindUserContext(r.Context(), userInfo); err != nil {
			return
		}
	default:
		contexts.SetUser(r.Context(), userInfo)
	}
	return
}
