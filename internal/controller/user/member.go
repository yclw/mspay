package user

import (
	"context"

	api "github.com/yclw/mspay/api/user"
	service "github.com/yclw/mspay/internal/service/user"
)

var (
	Member = cMember{}
)

type cMember struct{}

// Ping ping
func (c *cMember) Ping(_ context.Context, _ *api.PingReq) (res *api.PingRes, err error) {
	return
}

// MemberInfo 登录用户信息
func (c *cMember) MemberInfo(ctx context.Context, _ *api.InfoReq) (res *api.InfoRes, err error) {
	data, err := service.SUserMember.LoginMemberInfo(ctx)
	if err != nil {
		return
	}

	res = new(api.InfoRes)
	res.LoginMemberInfoModel = data
	return
}
