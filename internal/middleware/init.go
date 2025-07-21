package middleware

import (
	"github.com/gogf/gf/v2/frame/g"
)

var Middleware = NewMiddleware()

type cMiddleware struct {
	LoginUrl         string // 登录路由地址
	NotRecordRequest g.Map  // 不记录请求数据的路由（当前请求数据过大时会影响响应效率，可以将路径放到该选项中改善）
}

func NewMiddleware() *cMiddleware {
	return &cMiddleware{
		LoginUrl:         "/login",
		NotRecordRequest: g.Map{},
	}
}
