// Package middleware
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2023 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
package middleware

import (
	"net/http"
	"strings"

	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/errors/gcode"
	"github.com/gogf/gf/net/gtrace"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gctx"
	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/internal/service/user"
	"github.com/yclw/mspay/pkg/contexts"
	"github.com/yclw/mspay/pkg/response"
	"github.com/yclw/mspay/pkg/token"
	"github.com/yclw/mspay/util/simple"
	"go.opentelemetry.io/otel/attribute"
)

var SMiddleware = NewMiddleware()

type sMiddleware struct {
	LoginUrl         string // 登录路由地址
	DemoWhiteList    g.Map  // 演示模式放行的路由白名单
	NotRecordRequest g.Map  // 不记录请求数据的路由（当前请求数据过大时会影响响应效率，可以将路径放到该选项中改善）
}

func NewMiddleware() *sMiddleware {
	return &sMiddleware{
		LoginUrl: "/common",
		DemoWhiteList: g.Map{
			"/admin/site/accountLogin": struct{}{}, // 账号登录
			"/admin/site/mobileLogin":  struct{}{}, // 手机号登录
			"/admin/genCodes/preview":  struct{}{}, // 预览代码
		},
		NotRecordRequest: g.Map{
			"/admin/upload/file":       struct{}{}, // 上传文件
			"/admin/upload/uploadPart": struct{}{}, // 上传分片
		},
	}
}

// Ctx 初始化请求上下文
func (s *sMiddleware) Ctx(r *ghttp.Request) {
	if g.Cfg().MustGet(r.Context(), "jaeger.switch").Bool() {
		ctx, span := gtrace.NewSpan(r.Context(), "middleware.ctx")
		span.SetAttributes(attribute.KeyValue{
			Key:   "traceID",
			Value: attribute.StringValue(gctx.CtxId(ctx)),
		})
		span.End()
		r.SetCtx(ctx)
	}

	data := make(g.Map)
	if _, ok := s.NotRecordRequest[r.URL.Path]; ok {
		data["request.body"] = gjson.New(nil)
	} else {
		data["request.body"] = gjson.New(r.GetBodyString())
	}

	contexts.Init(r, &contexts.Context{
		Data:   data,
		Module: getModule(r.URL.Path),
	})

	if len(r.Cookie.GetSessionId()) == 0 {
		r.Cookie.SetSessionId(gctx.CtxId(r.Context()))
	}

	r.SetCtx(r.GetNeverDoneCtx())
	r.Middleware.Next()
}

func getModule(path string) (module string) {
	slice := strings.Split(path, "/")
	if len(slice) < 2 {
		module = consts.AppDefault
		return
	}

	if slice[1] == "" {
		module = consts.AppDefault
		return
	}
	return slice[1]
}

// CORS allows Cross-origin resource sharing.
func (s *sMiddleware) CORS(r *ghttp.Request) {
	r.Response.CORSDefault()
	r.Middleware.Next()
}

// DemoLimit 演示系统操作限制
func (s *sMiddleware) DemoLimit(r *ghttp.Request) {
	if !simple.IsDemo(r.Context()) {
		r.Middleware.Next()
		return
	}

	if r.Method == http.MethodPost {
		if _, ok := s.DemoWhiteList[r.URL.Path]; ok {
			r.Middleware.Next()
			return
		}
		response.JsonExit(r, gcode.CodeNotSupported.Code(), "演示系统禁止操作！")
		return
	}

	r.Middleware.Next()
}

// DeliverUserContext 将用户信息传递到上下文中
func (s *sMiddleware) DeliverUserContext(r *ghttp.Request) (err error) {
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
