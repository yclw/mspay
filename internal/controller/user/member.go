package user

import (
	"context"

	api "github.com/yclw/mspay/api/user"
	service "github.com/yclw/mspay/internal/service/user"
)

var Member = cMember{}

// 依赖
var (
	MemberService = service.SUserMember
	// RoleService   = service.SUserRole
)

type cMember struct{}

// Ping ping
func (c *cMember) Ping(_ context.Context, _ *api.PingReq) (res *api.PingRes, err error) {
	return
}

// MemberInfo 用户信息
func (c *cMember) MemberInfo(ctx context.Context, _ *api.MemberInfoReq) (res *api.MemberInfoRes, err error) {
	data, err := MemberService.MemberInfo(ctx)
	if err != nil {
		return
	}

	// 获取用户菜单权限
	permissions, err := RoleService.Permissions(ctx)
	if err != nil {
		return
	}
	data.Permissions = permissions

	res = new(api.MemberInfoRes)
	res.MemberInfoModel = data
	return
}

// List 查看用户列表
func (c *cMember) List(ctx context.Context, req *api.MemberListReq) (res *api.MemberListRes, err error) {
	list, totalCount, err := MemberService.List(ctx, &req.MemberListInp)
	if err != nil {
		return
	}

	res = new(api.MemberListRes)
	res.List = list
	res.PageRes.Pack(req, totalCount)
	return
}
