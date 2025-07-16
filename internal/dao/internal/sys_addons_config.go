// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// SysAddonsConfigDao is the data access object for the table hg_sys_addons_config.
type SysAddonsConfigDao struct {
	table    string                 // table is the underlying table name of the DAO.
	group    string                 // group is the database configuration group name of the current DAO.
	columns  SysAddonsConfigColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler     // handlers for customized model modification.
}

// SysAddonsConfigColumns defines and stores column names for the table hg_sys_addons_config.
type SysAddonsConfigColumns struct {
	Id           string // 配置ID
	AddonName    string // 插件名称
	Group        string // 分组
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

// sysAddonsConfigColumns holds the columns for the table hg_sys_addons_config.
var sysAddonsConfigColumns = SysAddonsConfigColumns{
	Id:           "id",
	AddonName:    "addon_name",
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

// NewSysAddonsConfigDao creates and returns a new DAO object for table data access.
func NewSysAddonsConfigDao(handlers ...gdb.ModelHandler) *SysAddonsConfigDao {
	return &SysAddonsConfigDao{
		group:    "default",
		table:    "hg_sys_addons_config",
		columns:  sysAddonsConfigColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *SysAddonsConfigDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *SysAddonsConfigDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *SysAddonsConfigDao) Columns() SysAddonsConfigColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *SysAddonsConfigDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *SysAddonsConfigDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *SysAddonsConfigDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
