package hgpay

import (
	"hotgo/internal/model/input/form"
	"hotgo/internal/model/input/hgpayin"

	"github.com/gogf/gf/v2/frame/g"
)

// ChannelApplyListReq 查询支付渠道申请列表
type ChannelApplyListReq struct {
	g.Meta `path:"/payChannelApply/list" method:"get" tags:"支付渠道申请" summary:"获取支付渠道申请列表"`
	hgpayin.ChannelApplyListInp
}

type ChannelApplyListRes struct {
	form.PageRes
	List []*hgpayin.ChannelApplyListModel `json:"list" dc:"数据列表"`
}

// ChannelApplyExportReq 导出支付渠道申请列表
type ChannelApplyExportReq struct {
	g.Meta `path:"/payChannelApply/export" method:"get" tags:"支付渠道申请" summary:"导出支付渠道申请列表"`
	hgpayin.ChannelApplyListInp
}

type ChannelApplyExportRes struct{}

// ChannelApplyViewReq 获取支付渠道申请详情
type ChannelApplyViewReq struct {
	g.Meta `path:"/payChannelApply/view" method:"get" tags:"支付渠道申请" summary:"获取支付渠道申请详情"`
	hgpayin.ChannelApplyViewInp
}

type ChannelApplyViewRes struct {
	*hgpayin.ChannelApplyViewModel
}

// ChannelApplyEditReq 更新支付渠道申请
type ChannelApplyEditReq struct {
	g.Meta `path:"/payChannelApply/edit" method:"post" tags:"支付渠道申请" summary:"更新支付渠道申请"`
	hgpayin.ChannelApplyEditInp
}

type ChannelApplyEditRes struct{}

// ChannelApplyDeleteReq 删除支付渠道申请
type ChannelApplyDeleteReq struct {
	g.Meta `path:"/payChannelApply/delete" method:"post" tags:"支付渠道申请" summary:"删除支付渠道申请"`
	hgpayin.ChannelApplyDeleteInp
}

type ChannelApplyDeleteRes struct{}

// ChannelApplyAuditReq 审核支付渠道申请
type ChannelApplyAuditReq struct {
	g.Meta `path:"/payChannelApply/audit" method:"post" tags:"支付渠道申请" summary:"审核支付渠道申请"`
	hgpayin.ChannelApplyAuditInp
}

type ChannelApplyAuditRes struct{}

// ChannelApplyStatusReq 更新支付渠道申请状态
type ChannelApplyStatusReq struct {
	g.Meta `path:"/payChannelApply/status" method:"post" tags:"支付渠道申请" summary:"更新支付渠道申请状态"`
	hgpayin.ChannelApplyStatusInp
}

type ChannelApplyStatusRes struct{}

// ChannelApplySwitchReq 更新支付渠道申请开关状态
type ChannelApplySwitchReq struct {
	g.Meta `path:"/payChannelApply/switch" method:"post" tags:"支付渠道申请" summary:"更新支付渠道申请开关状态"`
	hgpayin.ChannelApplySwitchInp
}

type ChannelApplySwitchRes struct{}

// ChannelApplyMaxSortReq 获取支付渠道申请最大排序
type ChannelApplyMaxSortReq struct {
	g.Meta `path:"/payChannelApply/maxSort" method:"get" tags:"支付渠道申请" summary:"获取支付渠道申请最大排序"`
	hgpayin.ChannelApplyMaxSortInp
}

type ChannelApplyMaxSortRes struct {
	*hgpayin.ChannelApplyMaxSortModel
}
