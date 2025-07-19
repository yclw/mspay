package userin

import (
	"github.com/yclw/mspay/internal/model/entity"
	"github.com/yclw/mspay/internal/model/input/form"
)

// MemberPermissions 用户菜单权限信息
type MemberPermissions []string

// MenuEditInp 修改/新增菜单
type MenuEditInp struct {
	entity.AdminMenu
}

type MenuEditModel struct{}

// MenuDeleteInp 删除菜单
type MenuDeleteInp struct {
	Id interface{} `json:"id" v:"required#菜单ID不能为空" dc:"菜单ID"`
}

type MenuDeleteModel struct{}

// MenuListInp 获取菜单列表
type MenuListInp struct {
	form.PageReq
	Pid int64 `json:"pid" dc:"父ID"`
}

// MenuSearchListInp 查询菜单列表
type MenuSearchListInp struct {
	Name string `json:"name" dc:"菜单名称"`
	form.StatusReq
}

type MenuSearchListModel []*TreeMenu

// MenuTree 树
type MenuTree struct {
	entity.AdminMenu
	Key      int64       `json:"key" `
	Label    string      `json:"label"     dc:"标签"`
	Children []*MenuTree `json:"children"`
}

type MenuListModel struct {
	List []*MenuTree `json:"list"`
}

// MenuRouteMeta 菜单路由
// 解释参考：https://naive-ui-admin-docs.vercel.app/guide/router.html#%E5%A4%9A%E7%BA%A7%E8%B7%AF%E7%94%B1
type MenuRouteMeta struct {
	Title       string `json:"title"`                 // 菜单名称 一般必填
	Disabled    bool   `json:"disabled,omitempty"`    // 禁用菜单
	Icon        string `json:"icon,omitempty"`        // 菜单图标
	KeepAlive   bool   `json:"keepAlive,omitempty"`   // 缓存该路由
	Hidden      bool   `json:"hidden,omitempty"`      // 隐藏菜单
	Sort        int    `json:"sort,omitempty"`        // 排序越小越排前
	AlwaysShow  bool   `json:"alwaysShow,omitempty"`  // 取消自动计算根路由模式
	ActiveMenu  string `json:"activeMenu,omitempty"`  // 当路由设置了该属性，则会高亮相对应的侧边栏。
	IsRoot      bool   `json:"isRoot,omitempty"`      // 是否跟路由 顶部混合菜单，必须传 true，否则左侧会显示异常（场景就是，分割菜单之后，当一级菜单没有子菜单）
	FrameSrc    string `json:"frameSrc,omitempty" `   // 内联外部地址
	Permissions string `json:"permissions,omitempty"` // 菜单包含权限集合，满足其中一个就会显示
	Affix       bool   `json:"affix,omitempty"`       // 是否固定 设置为 true 之后 多页签不可删除
	Type        int    `json:"type"`                  // 菜单类型
}

type MenuRoute struct {
	Name      string         `json:"name"`
	Path      string         `json:"path"`
	Redirect  string         `json:"redirect"`
	Component string         `json:"component"`
	Meta      *MenuRouteMeta `json:"meta"`
	Children  []*MenuRoute   `json:"children,omitempty" dc:"子路由"`
}

// MenuRouteSummary 菜单树结构
type MenuRouteSummary struct {
	entity.AdminMenu
	Children []*MenuRouteSummary
}

// DynamicRes 动态路由
type DynamicModel struct {
	List []*MenuRoute `json:"list"   description:"数据列表"`
}
