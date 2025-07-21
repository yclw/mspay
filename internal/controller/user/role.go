package user

import (
	"context"

	api "github.com/yclw/mspay/api/user"
	"github.com/yclw/mspay/internal/consts"
	service "github.com/yclw/mspay/internal/service/user"
)

var Role = cRole{}

// 依赖
var (
	RoleService = service.SUserRole
)

type cRole struct{}

// GetPermissions 获取用户权限
func (c *cRole) GetPermissions(ctx context.Context, req *api.GetPermissionsReq) (res *api.GetPermissionsRes, err error) {
	model, err := RoleService.GetPermissions(ctx, &req.GetPermissionsInp)
	if err != nil {
		return
	}

	res = new(api.GetPermissionsRes)
	res.GetPermissionsModel = model
	return
}

// DataScopeSelect 获取数据权限选项
func (c *cRole) DataScopeSelect(ctx context.Context, req *api.DataScopeSelectReq) (res *api.DataScopeSelectRes, err error) {
	res = new(api.DataScopeSelectRes)
	res.List = consts.DataScopeSelect
	return
}

// UpdatePermissions 编辑角色菜单权限
func (c *cRole) UpdatePermissions(ctx context.Context, req *api.UpdatePermissionsReq) (res *api.UpdatePermissionsRes, err error) {
	err = RoleService.UpdatePermissions(ctx, &req.UpdatePermissionsInp)
	return
}

// List 获取列表
func (c *cRole) List(ctx context.Context, req *api.RoleListReq) (res *api.RoleListRes, err error) {
	list, totalCount, err := RoleService.List(ctx, &req.RoleListInp)
	if err != nil {
		return
	}

	res = new(api.RoleListRes)
	res.RoleListModel = list
	res.PageRes.Pack(req, totalCount)
	return
}

// Edit 修改角色
func (c *cRole) Edit(ctx context.Context, req *api.RoleEditReq) (res *api.RoleEditRes, err error) {
	err = RoleService.Edit(ctx, &req.RoleEditInp)
	return
}

// Delete 删除
func (c *cRole) Delete(ctx context.Context, req *api.RoleDeleteReq) (res *api.RoleDeleteRes, err error) {
	err = RoleService.Delete(ctx, &req.RoleDeleteInp)
	return
}
