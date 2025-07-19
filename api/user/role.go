package user

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/yclw/mspay/internal/model/input/userin"
)

// GetPermissionsReq 获取指定角色权限
type GetPermissionsReq struct {
	g.Meta `path:"/role/getPermissions" method:"get" tags:"角色" summary:"获取指定角色权限"`
	userin.GetPermissionsInp
}

type GetPermissionsRes struct {
	*userin.GetPermissionsModel
}

// ListReq 查询列表
type ListReq struct {
	g.Meta `path:"/role/list" method:"get" tags:"角色" summary:"获取角色列表"`
	userin.RoleListInp
}

type ListRes struct {
	*userin.RoleListModel
}
