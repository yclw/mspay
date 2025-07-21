// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// TMemberRole is the golang structure for table t_member_role.
type TMemberRole struct {
	MemberId int64 `json:"memberId" orm:"member_id" description:"管理员ID"`
	RoleId   int64 `json:"roleId"   orm:"role_id"   description:"角色ID"`
}
