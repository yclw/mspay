package userin

// GetPermissionsInp 获取指定角色的菜单权限
type GetPermissionsInp struct {
	RoleId int64 `json:"id" dc:"角色ID"`
}

type GetPermissionsModel struct {
	MenuIds []int64 `json:"menuIds" dc:"菜单ID"`
}
