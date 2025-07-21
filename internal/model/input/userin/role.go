package userin

import (
	"github.com/yclw/mspay/internal/model/entity"
	"github.com/yclw/mspay/internal/model/input/form"
)

// RoleListInp 获取列表
type RoleListInp struct {
	form.PageReq
}

type RoleListModel struct {
	List []*RoleTree `json:"list"`
	form.PageRes
}

type RoleTree struct {
	entity.TRoleInfo
	Label    string      `json:"label"     dc:"标签"`
	Value    int64       `json:"value"     dc:"键值"`
	Children []*RoleTree `json:"children"  dc:"子级"`
}

// RoleEditInp 修改角色
type RoleEditInp struct {
	Id int64 `json:"id"         description:"角色ID"`
	RoleInsertInp
}

// RoleInsertInp 新增角色
type RoleInsertInp struct {
	Name      string `json:"name"       description:"角色名称"`
	Key       string `json:"key"        description:"角色权限字符串"`
	DataScope int    `json:"dataScope"  description:"数据范围"`
	Pid       int64  `json:"pid"        description:"上级角色ID"`
	Level     int    `json:"level"      description:"关系树等级"`
	Tree      string `json:"tree"       description:"关系树"`
	Remark    string `json:"remark"     description:"备注"`
	Sort      int    `json:"sort"       description:"排序"`
	Status    int    `json:"status"     description:"角色状态"`
}

// RoleDeleteInp 删除角色
type RoleDeleteInp struct {
	Id int64 `json:"id" v:"required"`
}

// GetPermissionsInp 获取指定角色的菜单权限
type GetPermissionsInp struct {
	RoleId int64 `json:"id" dc:"角色ID"`
}

type GetPermissionsModel struct {
	MenuIds []int64 `json:"menuIds" dc:"菜单ID"`
}

// UpdatePermissionsInp 编辑角色菜单权限
type UpdatePermissionsInp struct {
	RoleId  int64   `json:"id"   dc:"角色ID"`
	MenuIds []int64 `json:"menuIds"  dc:"菜单ID"`
}
