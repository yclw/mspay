package global

import (
	"context"
	"fmt"
	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/pkg/cache"
	"github.com/yclw/mspay/util/simple"
	"github.com/yclw/mspay/util/validate"
	"runtime"

	"github.com/gogf/gf/contrib/trace/jaeger/v2"
	"github.com/gogf/gf/v2"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gfile"
	"github.com/gogf/gf/v2/os/glog"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/gogf/gf/v2/util/gmode"
)

func Init(ctx context.Context) {
	// 设置gf运行模式
	SetGFMode(ctx)

	// 设置服务日志处理
	glog.SetDefaultHandler(LoggingServeLogHandler)

	// 默认上海时区
	if err := gtime.SetTimeZone("Asia/Shanghai"); err != nil {
		g.Log().Fatalf(ctx, "时区设置异常 err：%+v", err)
		return
	}

	PrintWelcome()

	// 初始化链路追踪
	InitTrace(ctx)

	// 设置缓存适配器
	SetAdapter(ctx)

	// 订阅集群同步
	SubscribeClusterSync(ctx)
}

// PrintWelcome 输出欢迎信息
func PrintWelcome() {
	fmt.Printf("欢迎使用HotGo！\r\n当前运行环境：%v, 运行根路径为：%v \r\nHotGo版本：v%v, gf版本：%v \n", runtime.GOOS, gfile.Pwd(), consts.VersionApp, gf.VERSION)
}

// LoggingServeLogHandler 服务日志处理
func LoggingServeLogHandler(ctx context.Context, in *glog.HandlerInput) {
	in.Next(ctx)
}

// InitTrace 初始化链路追踪
func InitTrace(ctx context.Context) {
	if !g.Cfg().MustGet(ctx, "jaeger.switch").Bool() {
		return
	}

	tp, err := jaeger.Init(simple.AppName(ctx), g.Cfg().MustGet(ctx, "jaeger.endpoint").String())
	if err != nil {
		g.Log().Fatal(ctx, err)
	}

	simple.Event().Register(consts.EventServerClose, func(ctx context.Context, args ...interface{}) {
		_ = tp.Shutdown(ctx)
		g.Log().Debug(ctx, "jaeger closed ..")
	})
}

// SetGFMode 设置gf运行模式
func SetGFMode(ctx context.Context) {
	mode := g.Cfg().MustGet(ctx, "system.mode").String()
	if len(mode) == 0 {
		mode = gmode.NOT_SET
	}

	var modes = []string{gmode.DEVELOP, gmode.TESTING, gmode.STAGING, gmode.PRODUCT}

	// 如果是有效的运行模式，就进行设置
	if validate.InSlice(modes, mode) {
		gmode.Set(mode)
	}
}

// SetAdapter 设置缓存适配器
func SetAdapter(ctx context.Context) {
	adapterType := g.Cfg().MustGet(ctx, "cache.adapter").String()
	cache.SetAdapter(ctx, adapterType)
}

// SubscribeClusterSync 订阅集群同步，可以用来集中同步数据、状态等
func SubscribeClusterSync(ctx context.Context) {
	return
}
