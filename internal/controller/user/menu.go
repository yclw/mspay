package user

import (
	"context"

	api "github.com/yclw/mspay/api/user"
	service "github.com/yclw/mspay/internal/service/user"
	"github.com/yclw/mspay/pkg/contexts"
)

var Menu = cMenu{}

type cMenu struct{}

// Dynamic 动态路由
func (c *cMenu) Dynamic(ctx context.Context, _ *api.DynamicReq) (res *api.DynamicRes, err error) {
	model, err := service.SUserMenu.GetMenuList(ctx, contexts.GetUserId(ctx))
	if err != nil {
		return
	}
	res = new(api.DynamicRes)
	res.DynamicModel = model
	return
}
