package userin

import (
	"github.com/yclw/mspay/internal/model/entity"
	"github.com/yclw/mspay/internal/model/input/form"
)

// GetPermissionsInp 获取指定角色的菜单权限
type GetPermissionsInp struct {
	RoleId int64 `json:"id" dc:"角色ID"`
}

type GetPermissionsModel struct {
	MenuIds []int64 `json:"menuIds" dc:"菜单ID"`
}

// RoleListInp 获取列表
type RoleListInp struct {
	form.PageReq
}

type RoleListModel struct {
	List []*RoleTree `json:"list" dc:"列表"`
	form.PageRes
}

type RoleTree struct {
	entity.AdminRole
	Label    string      `json:"label"     dc:"标签"`
	Value    int64       `json:"value"     dc:"键值"`
	Children []*RoleTree `json:"children"  dc:"子级"`
}
