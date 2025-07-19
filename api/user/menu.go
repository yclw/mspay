package user

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/yclw/mspay/internal/model/input/userin"
)

// DynamicReq 动态路由
type DynamicReq struct {
	g.Meta `path:"/menu/dynamic" method:"get" tags:"菜单" summary:"获取动态路由" description:"获取登录用户动态路由"`
}

type DynamicRes struct {
	*userin.DynamicModel
}
