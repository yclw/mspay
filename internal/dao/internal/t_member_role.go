// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// TMemberRoleDao is the data access object for the table t_member_role.
type TMemberRoleDao struct {
	table    string             // table is the underlying table name of the DAO.
	group    string             // group is the database configuration group name of the current DAO.
	columns  TMemberRoleColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler // handlers for customized model modification.
}

// TMemberRoleColumns defines and stores column names for the table t_member_role.
type TMemberRoleColumns struct {
	MemberId string // 管理员ID
	RoleId   string // 角色ID
}

// tMemberRoleColumns holds the columns for the table t_member_role.
var tMemberRoleColumns = TMemberRoleColumns{
	MemberId: "member_id",
	RoleId:   "role_id",
}

// NewTMemberRoleDao creates and returns a new DAO object for table data access.
func NewTMemberRoleDao(handlers ...gdb.ModelHandler) *TMemberRoleDao {
	return &TMemberRoleDao{
		group:    "default",
		table:    "t_member_role",
		columns:  tMemberRoleColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *TMemberRoleDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *TMemberRoleDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *TMemberRoleDao) Columns() TMemberRoleColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *TMemberRoleDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *TMemberRoleDao) Ctx(ctx context.Context) *gdb.Model {
	model := dao.DB().Model(dao.table)
	for _, handler := range dao.handlers {
		model = handler(model)
	}
	return model.Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rolls back the transaction and returns the error if function f returns a non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note: Do not commit or roll back the transaction in function f,
// as it is automatically handled by this function.
func (dao *TMemberRoleDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
