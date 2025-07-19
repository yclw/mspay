package user

import (
	"context"

	"github.com/gogf/gf/text/gstr"
	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/internal/dao"
	"github.com/yclw/mspay/internal/model/input/userin"
	"github.com/yclw/mspay/pkg/contexts"
	"github.com/yclw/mspay/util/convert"
)

var SUserRole = NewUserRole()

type sUserRole struct{}

func NewUserRole() *sUserRole {
	return &sUserRole{}
}

// Permissions 获取用户角色权限
func (s *sUserRole) Permissions(ctx context.Context, memberId int64) (lists userin.MemberPermissions, err error) {
	// 定义内部结构体，用于接收数据库查询结果
	type Permissions struct {
		Permissions string `json:"permissions"` // 菜单权限标识，多个权限以逗号分隔
	}
	var allPermissions []*Permissions
	var mod = dao.AdminMenu.Ctx(ctx).
		Fields(dao.AdminMenu.Columns().Permissions).
		Where(dao.AdminMenu.Columns().Status, consts.StatusEnabled).
		WhereNot(dao.AdminMenu.Columns().Permissions, "")

	// 查询当前用户角色对应的菜单ID列表
	menuIds, err := dao.AdminRoleMenu.Ctx(ctx).
		Fields(dao.AdminRoleMenu.Columns().MenuId).
		Where(dao.AdminRoleMenu.Columns().RoleId, contexts.GetRoleId(ctx)).
		Array()
	if err != nil {
		return nil, err // 查询出错直接返回
	}
	// 只查询属于该角色的菜单权限
	mod = mod.Where("id", menuIds)

	// 执行查询，将结果扫描到 allPermissions 切片
	if err = mod.Scan(&allPermissions); err != nil {
		return // 查询出错直接返回
	}

	// 如果没有查询到任何权限，返回一个默认值（"value"），防止前端无权限时报错
	if len(allPermissions) == 0 {
		lists = append(lists, "value")
		return
	}

	// 遍历所有权限记录，将每条记录的权限字符串按逗号分割后，逐个添加到结果列表
	for _, v := range allPermissions {
		for _, p := range gstr.Explode(`,`, v.Permissions) {
			lists = append(lists, p)
		}
	}

	// 去重，确保每个权限只出现一次
	lists = convert.UniqueSlice(lists)
	return
}
