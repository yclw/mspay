package user

import (
	"context"

	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gmode"
	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/internal/dao"
	"github.com/yclw/mspay/internal/model/input/userin"
	"github.com/yclw/mspay/pkg/contexts"
	"github.com/yclw/mspay/util/validate"
)

var SUserMenu = NewUserMenu()

type sUserMenu struct{}

func NewUserMenu() *sUserMenu {
	return &sUserMenu{}
}

// GetMenuList 获取菜单列表
func (s *sUserMenu) GetMenuList(ctx context.Context, memberId int64) (res *userin.DynamicModel, err error) {
	var (
		allMenus []*userin.MenuRouteSummary
		menus    []*userin.MenuRouteSummary
		treeMap  = make(map[string][]*userin.MenuRouteSummary)
		mod      = dao.AdminMenu.Ctx(ctx).Where(dao.AdminMenu.Columns().Status, consts.StatusEnabled).WhereIn(dao.AdminMenu.Columns().Type, []int{1, 2})
	)

	menuIds, err := dao.AdminRoleMenu.Ctx(ctx).Fields(dao.AdminRoleMenu.Columns().MenuId).Where(dao.AdminRoleMenu.Columns().RoleId, contexts.GetRoleId(ctx)).Array()
	if err != nil {
		return nil, err
	}
	if len(menuIds) > 0 {
		pidList, err := dao.AdminMenu.Ctx(ctx).Fields(dao.AdminMenu.Columns().Pid).WhereIn(dao.AdminMenu.Columns().Id, menuIds).Group("pid").Array()
		if err != nil {
			return nil, err
		}
		if len(pidList) > 0 {
			menuIds = append(pidList, menuIds...)
		}
	}
	mod = mod.Where(dao.AdminMenu.Columns().Id, menuIds)

	if err = mod.Order(dao.AdminMenu.Columns().Sort, dao.AdminMenu.Columns().Id, "desc").Scan(&allMenus); err != nil || len(allMenus) == 0 {
		return
	}

	// 生产环境下隐藏一些菜单
	if gmode.IsProduct() {
		newMenus := make([]*userin.MenuRouteSummary, 0)
		devMenus := []string{"Develops", "doc"} // 如果你还有其他需要在生产环境隐藏的菜单，将菜单别名加入即可
		for _, menu := range allMenus {
			if !validate.InSlice(devMenus, menu.Name) {
				newMenus = append(newMenus, menu)
			}
		}
		allMenus = newMenus
	}

	for _, v := range allMenus {
		treeMap[gconv.String(v.Pid)] = append(treeMap[gconv.String(v.Pid)], v)
	}

	menus = treeMap["0"]
	for i := 0; i < len(menus); i++ {
		err = s.getChildrenList(menus[i], treeMap)
	}

	res = new(userin.DynamicModel)
	res.List = append(res.List, s.genNaiveMenus(menus)...)
	return
}

// getChildrenList 生成菜单树
func (s *sUserMenu) getChildrenList(menu *userin.MenuRouteSummary, treeMap map[string][]*userin.MenuRouteSummary) (err error) {
	menu.Children = treeMap[gconv.String(menu.Id)]
	for i := 0; i < len(menu.Children); i++ {
		if err = s.getChildrenList(menu.Children[i], treeMap); err != nil {
			return
		}
	}
	return
}

// genNaiveMenus 生成NaiveUI菜单格式
func (s *sUserMenu) genNaiveMenus(menus []*userin.MenuRouteSummary) (sources []*userin.MenuRoute) {
	for _, men := range menus {
		var source = new(userin.MenuRoute)
		source.Name = men.Name
		source.Path = men.Path
		source.Redirect = men.Redirect
		source.Component = men.Component
		source.Meta = &userin.MenuRouteMeta{
			Title:      men.Title,
			Icon:       men.Icon,
			KeepAlive:  men.KeepAlive == 1,
			Hidden:     men.Hidden == 1,
			Sort:       men.Sort,
			AlwaysShow: men.AlwaysShow == 1,
			ActiveMenu: men.ActiveMenu,
			IsRoot:     men.IsRoot == 1,
			FrameSrc:   men.FrameSrc,
			//Permissions: men.Permissions,
			Affix: men.Affix == 1,
			Type:  men.Type,
		}
		if len(men.Children) > 0 {
			source.Children = append(source.Children, s.genNaiveMenus(men.Children)...)
		}
		sources = append(sources, source)
	}
	return
}
