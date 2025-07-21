package user

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/internal/dao"
	"github.com/yclw/mspay/internal/model/entity"
	"github.com/yclw/mspay/internal/model/input/userin"
	"github.com/yclw/mspay/pkg/casbin"
	"github.com/yclw/mspay/pkg/contexts"
	"github.com/yclw/mspay/pkg/orm"
	"github.com/yclw/mspay/util/convert"
	"github.com/yclw/mspay/util/tree"
)

var SUserRole = NewUserRole()

type sUserRole struct{}

func NewUserRole() *sUserRole {
	return &sUserRole{}
}

// GetPermissions 更改角色菜单权限
func (s *sUserRole) GetPermissions(ctx context.Context, in *userin.GetPermissionsInp) (res *userin.GetPermissionsModel, err error) {
	menuIds, err := dao.TRoleMenu.Ctx(ctx).Fields(dao.TRoleMenu.Columns().MenuId).Where(dao.TRoleMenu.Columns().RoleId, in.RoleId).Array()
	if err != nil {
		return
	}

	if len(menuIds) == 0 {
		return
	}

	res = new(userin.GetPermissionsModel)
	res.MenuIds = make([]int64, len(menuIds))
	for i, v := range menuIds {
		res.MenuIds[i] = v.Int64()
	}
	return
}

// Permissions 获取角色权限
func (s *sUserRole) Permissions(ctx context.Context) (lists []string, err error) {
	// 定义内部结构体，用于接收数据库查询结果
	type Permissions struct {
		Permissions string `json:"permissions"` // 菜单权限标识，多个权限以逗号分隔
	}
	var permissions []*Permissions
	var mod = dao.TMenuInfo.Ctx(ctx).
		Fields(dao.TMenuInfo.Columns().Permissions).
		Where(dao.TMenuInfo.Columns().Status, consts.StatusEnabled).
		WhereNot(dao.TMenuInfo.Columns().Permissions, "")

	// 查询当前用户角色对应的菜单ID列表
	user := contexts.Get(ctx).User
	menuIds, err := dao.TRoleMenu.Ctx(ctx).
		Fields(dao.TRoleMenu.Columns().MenuId).
		Where(dao.TRoleMenu.Columns().RoleId, user.RoleId).
		Array()
	if err != nil {
		return nil, err // 查询出错直接返回
	}
	// 只查询属于该角色的菜单权限
	if user.RoleKey != consts.SuperRoleKey {
		mod = mod.Where("id", menuIds)
	}

	// 执行查询，将结果扫描到 allPermissions 切片
	if err = mod.Scan(&permissions); err != nil {
		return // 查询出错直接返回
	}

	// 如果没有查询到任何权限，返回一个默认值（"value"），防止前端无权限时报错
	if len(permissions) == 0 {
		lists = append(lists, "value")
	}

	// 遍历所有权限记录，将每条记录的权限字符串按逗号分割后，逐个添加到结果列表
	for _, v := range permissions {
		for _, p := range gstr.Explode(`,`, v.Permissions) {
			lists = append(lists, p)
		}
	}

	// 去重，确保每个权限只出现一次
	lists = convert.UniqueSlice(lists)
	return
}

// UpdatePermissions 更改角色菜单权限
func (s *sUserRole) UpdatePermissions(ctx context.Context, in *userin.UpdatePermissionsInp) (err error) {
	err = dao.TRoleMenu.Transaction(ctx, func(ctx context.Context, tx gdb.TX) (err error) {
		if _, err = dao.TRoleMenu.Ctx(ctx).Where("role_id", in.RoleId).Delete(); err != nil {
			err = gerror.Wrap(err, consts.ErrorORM)
			return
		}

		if in.MenuIds = convert.UniqueSlice(in.MenuIds); len(in.MenuIds) == 0 {
			return
		}

		list := make(g.List, 0, len(in.MenuIds))
		for _, v := range in.MenuIds {
			list = append(list, g.Map{
				"role_id": in.RoleId,
				"menu_id": v,
			})
		}

		if _, err = dao.TRoleMenu.Ctx(ctx).Data(list).OmitEmptyData().Insert(); err != nil {
			err = gerror.Wrap(err, consts.ErrorORM)
			return
		}
		return
	})

	if err != nil {
		return
	}
	return casbin.Refresh(ctx)
}

// Verify 验证权限
func (s *sUserRole) Verify(ctx context.Context, path, method string) bool {
	user := contexts.Get(ctx).User
	if user.RoleKey == consts.SuperRoleKey {
		return true
	}

	if user == nil {
		g.Log().Info(ctx, "admin Verify user = nil")
		return false
	}

	ok, err := casbin.Enforcer.Enforce(user.RoleKey, path, method)
	if err != nil {
		g.Log().Infof(ctx, "admin Verify Enforce err:%+v", err)
		return false
	}
	return ok
}

// List 获取列表
func (s *sUserRole) List(ctx context.Context, in *userin.RoleListInp) (res *userin.RoleListModel, totalCount int, err error) {
	var (
		mod    = dao.TRoleInfo.Ctx(ctx)
		models []*entity.TRoleInfo
		pid    int64 = 0
	)

	// 非超管只获取下级角色
	pid = contexts.GetRoleId(ctx)
	mod = mod.WhereLike(dao.TRoleInfo.Columns().Tree, "%"+tree.GetIdLabel(pid)+"%")

	totalCount, err = mod.Count()
	if err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return
	}

	if err = mod.Page(in.Page, in.PerPage).Order("sort asc,id asc").Scan(&models); err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return
	}

	res = new(userin.RoleListModel)
	res.List = s.treeList(pid, models)
	return
}

// treeList 角色树列表
func (s *sUserRole) treeList(pid int64, nodes []*entity.TRoleInfo) (list []*userin.RoleTree) {
	list = make([]*userin.RoleTree, 0)
	for _, v := range nodes {
		if v.Pid == pid {
			item := new(userin.RoleTree)
			item.TRoleInfo = *v
			item.Label = v.Name
			item.Value = v.Id

			child := s.treeList(v.Id, nodes)
			if len(child) > 0 {
				item.Children = child
			}
			list = append(list, item)
		}
	}
	return
}

// Edit 修改角色
func (s *sUserRole) Edit(ctx context.Context, in *userin.RoleEditInp) (err error) {
	if err = orm.IsUnique(ctx, &dao.TRoleInfo, g.Map{dao.TRoleInfo.Columns().Name: in.Name}, "名称已存在", in.Id); err != nil {
		return
	}

	if err = orm.IsUnique(ctx, &dao.TRoleInfo, g.Map{dao.TRoleInfo.Columns().Key: in.Key}, "编码已存在", in.Id); err != nil {
		return
	}

	if in.Pid, in.Level, in.Tree, err = orm.GenSubTree(ctx, &dao.TRoleInfo, in.Pid); err != nil {
		return
	}

	// 修改
	if in.Id > 0 {
		err = dao.TRoleInfo.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
			// 更新数据
			_, err = dao.TRoleInfo.Ctx(ctx).WherePri(in.Id).Data(in).Update()
			if err != nil {
				err = gerror.Wrap(err, consts.ErrorORM)
				return err
			}

			// 如果当前角色有子级,更新子级tree关系树
			return updateRoleChildrenTree(ctx, in.Id, in.Level, in.Tree)
		})
		return
	}

	// 新增
	if _, err = dao.TRoleInfo.Ctx(ctx).Data(in.RoleInsertInp).OmitEmptyData().Insert(); err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return
	}
	return
}

// updateRoleChildrenTree 更新角色子级树
func updateRoleChildrenTree(ctx context.Context, id int64, level int, _tree string) (err error) {
	var list []*entity.TRoleInfo
	if err = dao.TRoleInfo.Ctx(ctx).Where("pid", id).Scan(&list); err != nil {
		return
	}
	for _, child := range list {
		child.Level = level + 1
		child.Tree = tree.GenLabel(_tree, child.Pid)

		if _, err = dao.TRoleInfo.Ctx(ctx).Where("id", child.Id).Data("level", child.Level, "tree", child.Tree).Update(); err != nil {
			return
		}

		if err = updateRoleChildrenTree(ctx, child.Id, child.Level, child.Tree); err != nil {
			return
		}
	}
	return
}

// Delete 删除角色
func (s *sUserRole) Delete(ctx context.Context, in *userin.RoleDeleteInp) (err error) {
	var models *entity.TRoleInfo
	if err = dao.TRoleInfo.Ctx(ctx).Where("id", in.Id).Scan(&models); err != nil {
		return
	}

	if models == nil {
		return gerror.New("数据不存在或已删除！")
	}

	if models.Key == consts.SuperRoleKey {
		return gerror.New("超管角色禁止删除！")
	}

	has, err := dao.TRoleInfo.Ctx(ctx).Where("pid", models.Id).One()
	if err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return
	}

	if !has.IsEmpty() {
		return gerror.New("请先删除该角色下得所有子级！")
	}

	if _, err = dao.TRoleInfo.Ctx(ctx).Where("id", in.Id).Delete(); err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
	}
	return
}
