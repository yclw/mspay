// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// TDictTypeDao is the data access object for the table t_dict_type.
type TDictTypeDao struct {
	table    string             // table is the underlying table name of the DAO.
	group    string             // group is the database configuration group name of the current DAO.
	columns  TDictTypeColumns   // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler // handlers for customized model modification.
}

// TDictTypeColumns defines and stores column names for the table t_dict_type.
type TDictTypeColumns struct {
	Id        string // 字典类型ID
	Pid       string // 父类字典类型ID
	Name      string // 字典类型名称
	Type      string // 字典类型
	Sort      string // 排序
	Remark    string // 备注
	Status    string // 字典类型状态
	CreatedAt string // 创建时间
	UpdatedAt string // 更新时间
}

// tDictTypeColumns holds the columns for the table t_dict_type.
var tDictTypeColumns = TDictTypeColumns{
	Id:        "id",
	Pid:       "pid",
	Name:      "name",
	Type:      "type",
	Sort:      "sort",
	Remark:    "remark",
	Status:    "status",
	CreatedAt: "created_at",
	UpdatedAt: "updated_at",
}

// NewTDictTypeDao creates and returns a new DAO object for table data access.
func NewTDictTypeDao(handlers ...gdb.ModelHandler) *TDictTypeDao {
	return &TDictTypeDao{
		group:    "default",
		table:    "t_dict_type",
		columns:  tDictTypeColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *TDictTypeDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *TDictTypeDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *TDictTypeDao) Columns() TDictTypeColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *TDictTypeDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *TDictTypeDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *TDictTypeDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
