// Package paychannelapply
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2025 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
// @AutoGenerate Version 2.17.8
package paychannelapply

import (
	"github.com/yclw/mspay/internal/model/input/form"
	"github.com/yclw/mspay/internal/model/input/sysin"

	"github.com/gogf/gf/v2/frame/g"
)

// ListReq 查询支付渠道申请列表
type ListReq struct {
	g.Meta `path:"/payChannelApply/list" method:"get" tags:"支付渠道申请" summary:"获取支付渠道申请列表"`
	sysin.PayChannelApplyListInp
}

type ListRes struct {
	form.PageRes
	List []*sysin.PayChannelApplyListModel `json:"list"   dc:"数据列表"`
}

// ViewReq 获取支付渠道申请指定信息
type ViewReq struct {
	g.Meta `path:"/payChannelApply/view" method:"get" tags:"支付渠道申请" summary:"获取支付渠道申请指定信息"`
	sysin.PayChannelApplyViewInp
}

type ViewRes struct {
	*sysin.PayChannelApplyViewModel
}

// EditReq 修改/新增支付渠道申请
type EditReq struct {
	g.Meta `path:"/payChannelApply/edit" method:"post" tags:"支付渠道申请" summary:"修改/新增支付渠道申请"`
	sysin.PayChannelApplyEditInp
}

type EditRes struct{}

// DeleteReq 删除支付渠道申请
type DeleteReq struct {
	g.Meta `path:"/payChannelApply/delete" method:"post" tags:"支付渠道申请" summary:"删除支付渠道申请"`
	sysin.PayChannelApplyDeleteInp
}

type DeleteRes struct{}

// StatusReq 更新支付渠道申请状态
type StatusReq struct {
	g.Meta `path:"/payChannelApply/status" method:"post" tags:"支付渠道申请" summary:"更新支付渠道申请状态"`
	sysin.PayChannelApplyStatusInp
}

type StatusRes struct{}
