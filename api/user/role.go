package user

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/yclw/mspay/internal/model/input/commonin"
	"github.com/yclw/mspay/internal/model/input/userin"
)

// ListReq 查询列表
type RoleListReq struct {
	g.Meta `path:"/role/list" method:"get" tags:"角色" summary:"获取角色列表"`
	userin.RoleListInp
}

type RoleListRes struct {
	*userin.RoleListModel
}

// EditReq 修改/新增角色
type RoleEditReq struct {
	g.Meta `path:"/role/edit" method:"post" tags:"角色" summary:"修改/新增角色"`
	userin.RoleEditInp
}

type RoleEditRes struct{}

// DeleteReq 删除角色
type RoleDeleteReq struct {
	g.Meta `path:"/role/delete" method:"post" tags:"角色" summary:"删除角色"`
	userin.RoleDeleteInp
}

type RoleDeleteRes struct{}

// GetPermissionsReq 获取指定角色权限
type GetPermissionsReq struct {
	g.Meta `path:"/role/getPermissions" method:"get" tags:"角色" summary:"获取指定角色权限"`
	userin.GetPermissionsInp
}

type GetPermissionsRes struct {
	*userin.GetPermissionsModel
}

// DataScopeSelectReq 获取数据权限选项
type DataScopeSelectReq struct {
	g.Meta `path:"/role/dataScope/select" method:"get" tags:"角色" summary:"获取数据权限选项"`
}

type DataScopeSelectRes struct {
	List []commonin.GroupScopeSelect `json:"list" dc:"数据选项"`
}

type UpdatePermissionsReq struct {
	g.Meta `path:"/role/updatePermissions" method:"post" tags:"角色" summary:"编辑角色菜单权限"`
	userin.UpdatePermissionsInp
}

type UpdatePermissionsRes struct{}
