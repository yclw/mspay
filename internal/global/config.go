package global

import (
	"context"

	"github.com/yclw/mspay/pkg/token"

	"github.com/gogf/gf/v2/frame/g"
)

// InitConfig 初始化系统配置
func InitConfig(ctx context.Context) {
	if err := LoadConfig(ctx); err != nil {
		g.Log().Fatalf(ctx, "InitConfig fail：%+v", err)
	}
}

// LoadConfig 加载系统配置
func LoadConfig(ctx context.Context) (err error) {
	// 登录令牌配置
	tk, err := GetLoadToken(ctx)
	if err != nil {
		return
	}
	token.SetConfig(tk)

	// 更多
	// ...
	return
}

// GetLoadToken 获取本地token配置
func GetLoadToken(ctx context.Context) (conf *token.TokenConfig, err error) {
	err = g.Cfg().MustGet(ctx, "token").Scan(&conf)
	return
}
