package contexts

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
)

// Context 请求上下文结构
type Context struct {
	Module   string    // 应用模块
	User     *Identity // 上下文用户信息
	Response *Response // 请求响应
	Data     g.Map     // 自定kv变量
}

// Identity 通用身份模型
type Identity struct {
	Id       int64       `json:"id"              description:"用户ID"`
	Pid      int64       `json:"pid"             description:"上级ID"`
	RoleId   int64       `json:"roleId"          description:"角色ID"`
	RoleKey  string      `json:"roleKey"         description:"角色唯一标识符"`
	Username string      `json:"username"        description:"用户名"`
	RealName string      `json:"realName"        description:"姓名"`
	Avatar   string      `json:"avatar"          description:"头像"`
	Email    string      `json:"email"           description:"邮箱"`
	Mobile   string      `json:"mobile"          description:"手机号码"`
	App      string      `json:"app"             description:"登录应用"`
	LoginAt  *gtime.Time `json:"loginAt"         description:"登录时间"`
}

// Response HTTP响应
type Response struct {
	Code      int         `json:"code" example:"0" description:"状态码"`
	Message   string      `json:"message,omitempty" example:"操作成功" description:"提示消息"`
	Data      interface{} `json:"data,omitempty" description:"数据集"`
	Error     interface{} `json:"error,omitempty" description:"错误信息"`
	Timestamp int64       `json:"timestamp" example:"1640966400" description:"服务器时间戳"`
	TraceID   string      `json:"traceID" v:"0" example:"d0bb93048bc5c9164cdee845dcb7f820" description:"链路ID"`
}
