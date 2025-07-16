package simple

// 系统配置

import (
	"context"

	"github.com/gogf/gf/v2/frame/g"
)

// AppName 应用名称
func AppName(ctx context.Context) string {
	return g.Cfg().MustGet(ctx, "system.appName", "hotgo").String()
}

// Debug debug
func Debug(ctx context.Context) bool {
	return g.Cfg().MustGet(ctx, "system.debug", true).Bool()
}

// IsDemo 是否为演示系统
func IsDemo(ctx context.Context) bool {
	return g.Cfg().MustGet(ctx, "system.isDemo", true).Bool()
}

// IsCluster 是否为集群部署
func IsCluster(ctx context.Context) bool {
	return g.Cfg().MustGet(ctx, "system.isCluster", true).Bool()
}
