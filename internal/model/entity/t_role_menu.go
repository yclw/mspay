// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// TRoleMenu is the golang structure for table t_role_menu.
type TRoleMenu struct {
	RoleId int64 `json:"roleId" orm:"role_id" description:"角色ID"`
	MenuId int64 `json:"menuId" orm:"menu_id" description:"菜单ID"`
}
