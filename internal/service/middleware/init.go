// Package middleware
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2023 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
package middleware

import (
	"github.com/gogf/gf/v2/frame/g"
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
