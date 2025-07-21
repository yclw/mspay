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

// EditReq 修改/新增菜单
type MenuEditReq struct {
	g.Meta `path:"/menu/edit" method:"post" tags:"菜单" summary:"修改/新增菜单"`
	userin.MenuEditInp
}

type MenuEditRes struct{}

// DeleteReq 删除菜单
type MenuDeleteReq struct {
	g.Meta `path:"/menu/delete" method:"post" tags:"菜单" summary:"删除菜单"`
	userin.MenuDeleteInp
}

type MenuDeleteRes struct{}

// ListReq 获取菜单列表
type MenuListReq struct {
	g.Meta `path:"/menu/list" method:"get" tags:"菜单" summary:"获取菜单列表"`
	userin.MenuListInp
}

type MenuListRes struct {
	*userin.MenuListModel
}
