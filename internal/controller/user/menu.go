package user

import (
	"context"

	api "github.com/yclw/mspay/api/user"
	service "github.com/yclw/mspay/internal/service/user"
)

var Menu = cMenu{}

// 依赖
var (
	MenuService = service.SUserMenu
)

type cMenu struct{}

// Dynamic 动态路由
func (c *cMenu) Dynamic(ctx context.Context, _ *api.DynamicReq) (res *api.DynamicRes, err error) {
	model, err := MenuService.GetMenuList(ctx)
	if err != nil {
		return
	}
	res = new(api.DynamicRes)
	res.DynamicModel = model
	return
}

// List 获取列表
func (c *cMenu) List(ctx context.Context, req *api.MenuListReq) (res *api.MenuListRes, err error) {
	model, err := MenuService.List(ctx, &req.MenuListInp)
	if err != nil {
		return
	}
	res = new(api.MenuListRes)
	res.MenuListModel = model
	return
}

// Edit 更新
func (c *cMenu) Edit(ctx context.Context, req *api.MenuEditReq) (res *api.MenuEditRes, err error) {
	err = MenuService.Edit(ctx, &req.MenuEditInp)
	return
}

// Delete 删除
func (c *cMenu) Delete(ctx context.Context, req *api.MenuDeleteReq) (res *api.MenuDeleteRes, err error) {
	err = MenuService.Delete(ctx, &req.MenuDeleteInp)
	return
}
