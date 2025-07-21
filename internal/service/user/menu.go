package user

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/gogf/gf/v2/util/gmode"
	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/internal/dao"
	"github.com/yclw/mspay/internal/model/entity"
	"github.com/yclw/mspay/internal/model/input/commonin"
	"github.com/yclw/mspay/internal/model/input/userin"
	"github.com/yclw/mspay/pkg/casbin"
	"github.com/yclw/mspay/pkg/contexts"
	"github.com/yclw/mspay/pkg/orm"
	"github.com/yclw/mspay/util/validate"
)

var SUserMenu = NewUserMenu()

type sUserMenu struct{}

func NewUserMenu() *sUserMenu {
	return &sUserMenu{}
}

// GetMenuList 获取菜单列表
func (s *sUserMenu) GetMenuList(ctx context.Context) (res *userin.DynamicModel, err error) {
	var (
		allMenus []*userin.MenuRouteSummary
		menus    []*userin.MenuRouteSummary
		treeMap  = make(map[string][]*userin.MenuRouteSummary)
		mod      = dao.TMenuInfo.Ctx(ctx).Where(dao.TMenuInfo.Columns().Status, consts.StatusEnabled).WhereIn(dao.TMenuInfo.Columns().Type, []int{1, 2})
	)

	user := contexts.Get(ctx).User
	menuIds, err := dao.TRoleMenu.Ctx(ctx).
		Fields(dao.TRoleMenu.Columns().MenuId).
		Where(dao.TRoleMenu.Columns().RoleId, user.RoleId).
		Array()
	if err != nil {
		return nil, err
	}
	if len(menuIds) > 0 {
		pidList, err := dao.TMenuInfo.Ctx(ctx).Fields(dao.TMenuInfo.Columns().Pid).WhereIn(dao.TMenuInfo.Columns().Id, menuIds).Group("pid").Array()
		if err != nil {
			return nil, err
		}
		if len(pidList) > 0 {
			menuIds = append(pidList, menuIds...)
		}
	}

	if user.RoleKey != consts.SuperRoleKey {
		mod = mod.Where(dao.TMenuInfo.Columns().Id, menuIds)
	}

	if err = mod.Order(dao.TMenuInfo.Columns().Sort, dao.TMenuInfo.Columns().Id, "desc").Scan(&allMenus); err != nil || len(allMenus) == 0 {
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
			// Permissions: men.Permissions,
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

// List 获取菜单列表
func (s *sUserMenu) List(ctx context.Context, in *userin.MenuListInp) (res *userin.MenuListModel, err error) {
	var models []*entity.TMenuInfo
	if err = dao.TMenuInfo.Ctx(ctx).Order("sort asc,id desc").Scan(&models); err != nil {
		return
	}

	res = new(userin.MenuListModel)
	res.List = s.treeList(0, models)
	return
}

// treeList 树状列表
func (s *sUserMenu) treeList(pid int64, nodes []*entity.TMenuInfo) (list []*userin.MenuTree) {
	list = make([]*userin.MenuTree, 0)
	for _, v := range nodes {
		if v.Pid == pid {
			item := new(userin.MenuTree)
			item.TMenuInfo = *v
			item.Label = v.Title
			item.Key = v.Id

			child := s.treeList(v.Id, nodes)
			if len(child) > 0 {
				item.Children = child
			}
			list = append(list, item)
		}
	}
	return
}

// Edit 修改/新增
func (s *sUserMenu) Edit(ctx context.Context, in *userin.MenuEditInp) (err error) {
	// 验证唯一性
	err = s.verifyUnique(ctx, &commonin.VerifyUniqueInp{
		Id: in.Id,
		Where: g.Map{
			dao.TMenuInfo.Columns().Title: in.Title,
			dao.TMenuInfo.Columns().Name:  in.Name,
		},
	})
	if err != nil {
		return
	}

	return g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		in.Pid, in.Level, in.Tree, err = orm.AutoUpdateTree(ctx, &dao.TMenuInfo, in.Id, in.Pid)
		if err != nil {
			return err
		}

		if in.Id > 0 {
			if _, err = dao.TMenuInfo.Ctx(ctx).Where(dao.TMenuInfo.Columns().Id, in.Id).Data(in).Update(); err != nil {
				err = gerror.Wrap(err, "修改菜单失败！")
				return err
			}
		} else {
			if _, err = dao.TMenuInfo.Ctx(ctx).Data(in).OmitEmptyData().Insert(); err != nil {
				err = gerror.Wrap(err, "新增菜单失败！")
				return err
			}
		}
		return casbin.Refresh(ctx)
	})
}

// VerifyUnique 验证菜单唯一属性
func (s *sUserMenu) verifyUnique(ctx context.Context, in *commonin.VerifyUniqueInp) (err error) {
	if in.Where == nil {
		return
	}

	msgMap := g.MapStrStr{
		dao.TMenuInfo.Columns().Name:  "菜单编码已存在，请换一个",
		dao.TMenuInfo.Columns().Title: "菜单名称已存在，请换一个",
	}

	for k, v := range in.Where {
		if v == "" {
			continue
		}
		message, ok := msgMap[k]
		if !ok {
			err = gerror.Newf("字段 [ %v ] 未配置唯一属性验证", k)
			return
		}
		if err = orm.IsUnique(ctx, &dao.TMenuInfo, g.Map{k: v}, message, in.Id); err != nil {
			return
		}
	}
	return
}

// Delete 删除
func (s *sUserMenu) Delete(ctx context.Context, in *userin.MenuDeleteInp) (err error) {
	exist, err := dao.TMenuInfo.Ctx(ctx).Where(dao.TMenuInfo.Columns().Pid, in.Id).One()
	if err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return
	}
	if !exist.IsEmpty() {
		err = gerror.New("请先删除该菜单下的所有菜单！")
		return
	}
	_, err = dao.TMenuInfo.Ctx(ctx).Where(dao.TMenuInfo.Columns().Id, in.Id).Delete()
	return
}
