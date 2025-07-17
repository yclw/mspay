package contexts

import (
	"context"

	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
)

// Init 初始化上下文对象指针到上下文对象中，以便后续的请求流程中可以修改
func Init(r *ghttp.Request, customCtx *Context) {
	r.SetCtxVar(ContextHTTPKey, customCtx)
}

// Get 获得上下文变量，如果没有设置，那么返回nil
func Get(ctx context.Context) *Context {
	value := ctx.Value(ContextHTTPKey)
	if value == nil {
		return nil
	}
	if localCtx, ok := value.(*Context); ok {
		return localCtx
	}
	return nil
}

// SetUser 将上下文信息设置到上下文请求中，注意是完整覆盖
func SetUser(ctx context.Context, user *Identity) {
	c := Get(ctx)
	if c == nil {
		g.Log().Warning(ctx, "contexts.SetUser, c == nil ")
		return
	}
	c.User = user
}

// SetResponse 设置组件响应 用于访问日志使用
func SetResponse(ctx context.Context, response *Response) {
	c := Get(ctx)
	if c == nil {
		g.Log().Warning(ctx, "contexts.SetResponse, c == nil ")
		return
	}
	c.Response = response
}

// SetModule 设置应用模块
func SetModule(ctx context.Context, module string) {
	c := Get(ctx)
	if c == nil {
		g.Log().Warning(ctx, "contexts.SetModule, c == nil ")
		return
	}
	c.Module = module
}

// GetUser 获取用户信息
func GetUser(ctx context.Context) *Identity {
	c := Get(ctx)
	if c == nil {
		return nil
	}
	return c.User
}

// GetUserId 获取用户ID
func GetUserId(ctx context.Context) int64 {
	user := GetUser(ctx)
	if user == nil {
		return 0
	}
	return user.Id
}

// GetRoleId 获取用户角色ID
func GetRoleId(ctx context.Context) int64 {
	user := GetUser(ctx)
	if user == nil {
		return 0
	}
	return user.RoleId
}

// GetRoleKey 获取用户角色唯一编码
func GetRoleKey(ctx context.Context) string {
	user := GetUser(ctx)
	if user == nil {
		return ""
	}
	return user.RoleKey
}

// GetModule 获取应用模块
func GetModule(ctx context.Context) string {
	c := Get(ctx)
	if c == nil {
		return ""
	}
	return c.Module
}

// SetData 设置额外数据
func SetData(ctx context.Context, k string, v interface{}) {
	c := Get(ctx)
	if c == nil {
		g.Log().Warning(ctx, "contexts.SetData, c == nil ")
		return
	}
	Get(ctx).Data[k] = v
}

// SetDataMap 设置额外数据
func SetDataMap(ctx context.Context, vs g.Map) {
	c := Get(ctx)
	if c == nil {
		g.Log().Warning(ctx, "contexts.SetData, c == nil ")
		return
	}

	for k, v := range vs {
		Get(ctx).Data[k] = v
	}
}

// GetData 获取额外数据
func GetData(ctx context.Context) g.Map {
	c := Get(ctx)
	if c == nil {
		return nil
	}
	return c.Data
}
