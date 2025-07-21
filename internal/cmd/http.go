package cmd

import (
	"context"

	"github.com/yclw/mspay/internal/hook"
	"github.com/yclw/mspay/internal/middleware"
	"github.com/yclw/mspay/internal/router"
	"github.com/yclw/mspay/pkg/casbin"

	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gcmd"
)

var (
	Http = &gcmd.Command{
		Name:  "http",
		Usage: "http",
		Brief: "HTTP服务，也可以称为主服务，包含http、websocket、tcpserver多个可对外服务",
		Func: func(ctx context.Context, parser *gcmd.Parser) (err error) {
			// 初始化http服务
			s := g.Server()

			// 初始化请求前回调
			s.BindHookHandler("/*any", ghttp.HookBeforeServe, hook.Hook.BeforeServe)

			// 请求响应结束后回调
			s.BindHookHandler("/*any", ghttp.HookAfterOutput, hook.Hook.AfterOutput)

			// 注册全局中间件
			s.BindMiddleware("/*any", []ghttp.HandlerFunc{
				middleware.Middleware.Ctx,             // 初始化请求上下文，一般需要第一个进行加载，后续中间件存在依赖关系
				middleware.Middleware.CORS,            // 跨域中间件，自动处理跨域问题
				middleware.Middleware.PreFilter,       // 请求输入预处理，api使用gf规范路由并且XxxReq结构体实现了validate.Filter接口即可隐式预处理
				middleware.Middleware.ResponseHandler, // HTTP响应预处理，在业务处理完成后，对响应结果进行格式化和错误过滤，将处理后的数据发送给请求方
			}...)

			s.Group("/", func(group *ghttp.RouterGroup) {
				// 注册后台路由
				router.Admin(ctx, group)
			})

			// 初始化casbin权限
			// provider := casbin.NewPolicyProvider()
			// pkgcasbin.InitEnforcer(ctx, dao.AdminRoleCasbin.Table(), provider, "config/casbin.conf")
			casbin.InitEnforcer(ctx)

			serverWg.Add(1)

			// 信号监听
			signalListen(ctx, signalHandlerForOverall)

			go func() {
				<-serverCloseSignal
				_ = s.Shutdown() // 关闭http服务，主服务建议放在最后一个关闭
				g.Log().Debug(ctx, "http successfully closed ..")
				serverWg.Done()
			}()

			// Just run the server.
			s.Run()
			return
		},
	}
)
