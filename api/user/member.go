package user

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/yclw/mspay/internal/model/input/userin"
)

// PingReq ping
type PingReq struct {
	g.Meta `path:"/member/ping" method:"get" tags:"用户" summary:"ping"`
}

type PingRes struct{}

// InfoReq 获取登录用户信息
type InfoReq struct {
	g.Meta `path:"/member/info" method:"get" tags:"用户" summary:"获取登录用户信息"`
}

type InfoRes struct {
	*userin.LoginMemberInfoModel
}
