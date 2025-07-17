// Package paychannelaudit
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2025 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
// @AutoGenerate Version 2.17.8
package paychannelaudit

import (
	"hotgo/internal/model/input/form"
	"hotgo/internal/model/input/sysin"

	"github.com/gogf/gf/v2/frame/g"
)

// ListReq 查询支付渠道审核列表
type ListReq struct {
	g.Meta `path:"/payChannelAudit/list" method:"get" tags:"支付渠道审核" summary:"获取支付渠道审核列表"`
	sysin.PayChannelAuditListInp
}

type ListRes struct {
	form.PageRes
	List []*sysin.PayChannelAuditListModel `json:"list"   dc:"数据列表"`
}

// ExportReq 导出支付渠道审核列表
type ExportReq struct {
	g.Meta `path:"/payChannelAudit/export" method:"get" tags:"支付渠道审核" summary:"导出支付渠道审核列表"`
	sysin.PayChannelAuditListInp
}

type ExportRes struct{}

// ViewReq 获取支付渠道审核指定信息
type ViewReq struct {
	g.Meta `path:"/payChannelAudit/view" method:"get" tags:"支付渠道审核" summary:"获取支付渠道审核指定信息"`
	sysin.PayChannelAuditViewInp
}

type ViewRes struct {
	*sysin.PayChannelAuditViewModel
}

// EditReq 修改/新增支付渠道审核
type EditReq struct {
	g.Meta `path:"/payChannelAudit/edit" method:"post" tags:"支付渠道审核" summary:"修改/新增支付渠道审核"`
	sysin.PayChannelAuditEditInp
}

type EditRes struct{}

// DeleteReq 删除支付渠道审核
type DeleteReq struct {
	g.Meta `path:"/payChannelAudit/delete" method:"post" tags:"支付渠道审核" summary:"删除支付渠道审核"`
	sysin.PayChannelAuditDeleteInp
}

type DeleteRes struct{}

// StatusReq 更新支付渠道审核状态
type StatusReq struct {
	g.Meta `path:"/payChannelAudit/status" method:"post" tags:"支付渠道审核" summary:"更新支付渠道审核状态"`
	sysin.PayChannelAuditStatusInp
}

type StatusRes struct{}
