// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
)

// TMenuInfo is the golang structure of table t_menu_info for DAO operations like Where/Data.
type TMenuInfo struct {
	g.Meta         `orm:"table:t_menu_info, do:true"`
	Id             interface{} // 菜单ID
	Pid            interface{} // 父菜单ID
	Level          interface{} // 关系树等级
	Tree           interface{} // 关系树
	Title          interface{} // 菜单名称
	Name           interface{} // 名称编码
	Path           interface{} // 路由地址
	Icon           interface{} // 菜单图标
	Type           interface{} // 菜单类型（1目录 2菜单 3按钮）
	Redirect       interface{} // 重定向地址
	Permissions    interface{} // 菜单包含权限集合
	PermissionName interface{} // 权限名称
	Component      interface{} // 组件路径
	AlwaysShow     interface{} // 取消自动计算根路由模式
	ActiveMenu     interface{} // 高亮菜单编码
	IsRoot         interface{} // 是否跟路由
	IsFrame        interface{} // 是否内嵌
	FrameSrc       interface{} // 内联外部地址
	KeepAlive      interface{} // 缓存该路由
	Hidden         interface{} // 是否隐藏
	Affix          interface{} // 是否固定
	Sort           interface{} // 排序
	Remark         interface{} // 备注
	Status         interface{} // 菜单状态
	UpdatedAt      *gtime.Time // 更新时间
	CreatedAt      *gtime.Time // 创建时间
}
