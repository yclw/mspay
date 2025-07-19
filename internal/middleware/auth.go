package middleware

import (
	"context"
	"fmt"

	"github.com/gogf/gf/v2/errors/gcode"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/pkg/response"
	"github.com/yclw/mspay/util/simple"
	"github.com/yclw/mspay/util/validate"
)

// Auth 后台鉴权中间件
func (s *sMiddleware) Auth(r *ghttp.Request) {
	var (
		ctx  = r.Context()
		path = gstr.Replace(r.URL.Path, simple.RouterPrefix(ctx, consts.AppAdmin), "", 1)
	)

	// 不需要验证登录的路由地址
	if s.IsExceptLogin(ctx, consts.AppAdmin, path) {
		r.Middleware.Next()
		return
	}

	// 将用户信息传递到上下文中
	if err := s.DeliverUserContext(r); err != nil {
		response.JsonExit(r, gcode.CodeNotAuthorized.Code(), err.Error())
		return
	}

	r.Middleware.Next()
}

// IsExceptLogin 是否是不需要登录的路由地址
func (s *sMiddleware) IsExceptLogin(ctx context.Context, appName, path string) bool {
	pathList := g.Cfg().MustGet(ctx, fmt.Sprintf("router.%v.exceptLogin", appName)).Strings()

	for i := 0; i < len(pathList); i++ {
		if validate.InSliceExistStr(pathList[i], path) {
			return true
		}
	}
	return false
}
