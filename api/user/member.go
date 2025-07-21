package user

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/yclw/mspay/internal/model/input/form"
	"github.com/yclw/mspay/internal/model/input/userin"
)

// PingReq ping
type PingReq struct {
	g.Meta `path:"/member/ping" method:"get" tags:"用户" summary:"ping"`
}

type PingRes struct{}

// MemberInfoReq 获取用户信息
type MemberInfoReq struct {
	g.Meta `path:"/member/info" method:"get" tags:"用户" summary:"获取登录用户信息"`
}

type MemberInfoRes struct {
	*userin.MemberInfoModel
}

// ListReq 查询列表
type MemberListReq struct {
	g.Meta `path:"/member/list" method:"get" tags:"用户" summary:"获取用户列表"`
	userin.MemberListInp
}

type MemberListRes struct {
	List []*userin.MemberListModel `json:"list"   dc:"数据列表"`
	form.PageRes
}

// ViewReq 获取指定信息
type MemberViewReq struct {
	g.Meta `path:"/member/view" method:"get" tags:"用户" summary:"获取指定信息"`
	userin.MemberViewInp
}

type MemberViewRes struct {
	*userin.MemberViewModel
}

// EditReq 修改/新增
type MemberEditReq struct {
	g.Meta `path:"/member/edit" method:"post" tags:"用户" summary:"修改/新增用户"`
	userin.MemberEditInp
}

type MemberEditRes struct{}

// DeleteReq 删除
type MemberDeleteReq struct {
	g.Meta `path:"/member/delete" method:"post" tags:"用户" summary:"删除用户"`
	userin.MemberDeleteInp
}

type MemberDeleteRes struct{}
