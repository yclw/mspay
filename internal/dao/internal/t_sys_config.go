// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// TSysConfigDao is the data access object for the table t_sys_config.
type TSysConfigDao struct {
	table    string             // table is the underlying table name of the DAO.
	group    string             // group is the database configuration group name of the current DAO.
	columns  TSysConfigColumns  // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler // handlers for customized model modification.
}

// TSysConfigColumns defines and stores column names for the table t_sys_config.
type TSysConfigColumns struct {
	Id           string // 配置ID
	Group        string // 配置分组
	Name         string // 参数名称
	Type         string // 键值类型:string,int,uint,bool,datetime,date
	Key          string // 参数键名
	Value        string // 参数键值
	DefaultValue string // 默认值
	Sort         string // 排序
	Tip          string // 变量描述
	IsDefault    string // 是否为系统默认
	Status       string // 状态
	CreatedAt    string // 创建时间
	UpdatedAt    string // 更新时间
}

// tSysConfigColumns holds the columns for the table t_sys_config.
var tSysConfigColumns = TSysConfigColumns{
	Id:           "id",
	Group:        "group",
	Name:         "name",
	Type:         "type",
	Key:          "key",
	Value:        "value",
	DefaultValue: "default_value",
	Sort:         "sort",
	Tip:          "tip",
	IsDefault:    "is_default",
	Status:       "status",
	CreatedAt:    "created_at",
	UpdatedAt:    "updated_at",
}

// NewTSysConfigDao creates and returns a new DAO object for table data access.
func NewTSysConfigDao(handlers ...gdb.ModelHandler) *TSysConfigDao {
	return &TSysConfigDao{
		group:    "default",
		table:    "t_sys_config",
		columns:  tSysConfigColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *TSysConfigDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *TSysConfigDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *TSysConfigDao) Columns() TSysConfigColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *TSysConfigDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *TSysConfigDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *TSysConfigDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
