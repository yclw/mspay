// Package router
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2023 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
package router

import (
	"context"

	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/internal/controller/sys"
	"github.com/yclw/mspay/internal/controller/user"
	"github.com/yclw/mspay/internal/middleware"
	"github.com/yclw/mspay/util/simple"

	"github.com/gogf/gf/v2/net/ghttp"
)

func Admin(ctx context.Context, group *ghttp.RouterGroup) {
	// 兼容后台登录入口
	group.ALL("/login", func(r *ghttp.Request) {
		r.Response.RedirectTo("/admin")
	})

	group.Group(simple.RouterPrefix(ctx, consts.AppAdmin), func(group *ghttp.RouterGroup) {
		group.Bind(
			user.Login, // 登录
			sys.Config, // 配置
		)
		group.Middleware(middleware.Middleware.Auth)
		group.Bind(
			user.Member,  // 用户
			user.Menu,    // 菜单
			user.Role,    // 角色
			sys.DictType, // 字典类型
			sys.DictData, // 字典数据
		)
	})
}
