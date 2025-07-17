package hgpayin

import (
	"context"
	"hotgo/internal/model/entity"
	"hotgo/internal/model/input/form"

	"github.com/gogf/gf/v2/os/gtime"
)

// ChannelApplyCreateInp 创建支付渠道申请
type ChannelApplyCreateInp struct {
	ShopName        string  `json:"shopName" v:"required|length:1,100#店铺名称不能为空|店铺名称长度应当在:min到:max之间" dc:"店铺名称"`
	Domain          string  `json:"domain" v:"required|length:1,255#网站域名不能为空|网站域名长度应当在:min到:max之间" dc:"网站域名"`
	ChannelType     int     `json:"channelType" v:"required|in:1,2#渠道类型不能为空|渠道类型值错误" dc:"申请渠道类型(1-微信个人支付, 2-支付宝个人支付)"`
	ChannelFee      float64 `json:"channelFee" v:"required|min:0#申请费用不能为空|申请费用必须大于等于0" dc:"申请费用"`
	IdCardName      string  `json:"idCardName" v:"required|length:1,50#身份证姓名不能为空|身份证姓名长度应当在:min到:max之间" dc:"身份证姓名"`
	IdCardNumber    string  `json:"idCardNumber" v:"required|length:18,18#身份证号码不能为空|身份证号码长度必须为18位" dc:"身份证号码"`
	IdCardFront     string  `json:"idCardFront" v:"required#身份证正面照片不能为空" dc:"身份证正面照片"`
	IdCardBack      string  `json:"idCardBack" v:"required#身份证反面照片不能为空" dc:"身份证反面照片"`
	BankCardNumber  string  `json:"bankCardNumber" v:"required|length:1,30#银行卡号不能为空|银行卡号长度应当在:min到:max之间" dc:"银行卡号"`
	BankName        string  `json:"bankName" v:"required|length:1,100#银行名称不能为空|银行名称长度应当在:min到:max之间" dc:"银行名称"`
	BankAccountName string  `json:"bankAccountName" v:"required|length:1,50#银行账户姓名不能为空|银行账户姓名长度应当在:min到:max之间" dc:"银行账户姓名"`
	ApplyReason     string  `json:"applyReason" v:"max-length:500#申请理由长度不能超过500字符" dc:"申请理由"`
	Remark          string  `json:"remark" v:"max-length:500#备注长度不能超过500字符" dc:"备注"`
}

func (in *ChannelApplyCreateInp) Filter(ctx context.Context) (err error) {
	return
}

type ChannelApplyCreateModel struct {
	Id int64 `json:"id" dc:"申请ID"`
}

// ChannelApplyEditInp 编辑支付渠道申请
type ChannelApplyEditInp struct {
	Id              int64   `json:"id" v:"required#申请ID不能为空" dc:"申请ID"`
	ShopName        string  `json:"shopName" v:"required|length:1,100#店铺名称不能为空|店铺名称长度应当在:min到:max之间" dc:"店铺名称"`
	Domain          string  `json:"domain" v:"required|length:1,255#网站域名不能为空|网站域名长度应当在:min到:max之间" dc:"网站域名"`
	ChannelType     int     `json:"channelType" v:"required|in:1,2#渠道类型不能为空|渠道类型值错误" dc:"申请渠道类型(1-微信个人支付, 2-支付宝个人支付)"`
	ChannelFee      float64 `json:"channelFee" v:"required|min:0#申请费用不能为空|申请费用必须大于等于0" dc:"申请费用"`
	IdCardName      string  `json:"idCardName" v:"required|length:1,50#身份证姓名不能为空|身份证姓名长度应当在:min到:max之间" dc:"身份证姓名"`
	IdCardNumber    string  `json:"idCardNumber" v:"required|length:18,18#身份证号码不能为空|身份证号码长度必须为18位" dc:"身份证号码"`
	IdCardFront     string  `json:"idCardFront" v:"required#身份证正面照片不能为空" dc:"身份证正面照片"`
	IdCardBack      string  `json:"idCardBack" v:"required#身份证反面照片不能为空" dc:"身份证反面照片"`
	BankCardNumber  string  `json:"bankCardNumber" v:"required|length:1,30#银行卡号不能为空|银行卡号长度应当在:min到:max之间" dc:"银行卡号"`
	BankName        string  `json:"bankName" v:"required|length:1,100#银行名称不能为空|银行名称长度应当在:min到:max之间" dc:"银行名称"`
	BankAccountName string  `json:"bankAccountName" v:"required|length:1,50#银行账户姓名不能为空|银行账户姓名长度应当在:min到:max之间" dc:"银行账户姓名"`
	ApplyReason     string  `json:"applyReason" v:"max-length:500#申请理由长度不能超过500字符" dc:"申请理由"`
	Remark          string  `json:"remark" v:"max-length:500#备注长度不能超过500字符" dc:"备注"`
}

func (in *ChannelApplyEditInp) Filter(ctx context.Context) (err error) {
	return
}

type ChannelApplyEditModel struct{}

// ChannelApplyDeleteInp 删除支付渠道申请
type ChannelApplyDeleteInp struct {
	Id int64 `json:"id" v:"required#申请ID不能为空" dc:"申请ID"`
}

func (in *ChannelApplyDeleteInp) Filter(ctx context.Context) (err error) {
	return
}

type ChannelApplyDeleteModel struct{}

// ChannelApplyViewInp 查看支付渠道申请详情
type ChannelApplyViewInp struct {
	Id int64 `json:"id" v:"required#申请ID不能为空" dc:"申请ID"`
}

func (in *ChannelApplyViewInp) Filter(ctx context.Context) (err error) {
	return
}

type ChannelApplyViewModel struct {
	*entity.PayChannelApply
}

// ChannelApplyListInp 获取支付渠道申请列表
type ChannelApplyListInp struct {
	form.PageReq
	Id          int64         `json:"id" dc:"申请ID"`
	MemberId    int64         `json:"memberId" dc:"申请人ID"`
	ShopName    string        `json:"shopName" dc:"店铺名称"`
	Domain      string        `json:"domain" dc:"网站域名"`
	ChannelType int           `json:"channelType" dc:"申请渠道类型"`
	AuditStatus int           `json:"auditStatus" dc:"审核状态"`
	Status      int           `json:"status" dc:"状态"`
	CreatedAt   []*gtime.Time `json:"createdAt" dc:"创建时间"`
}

func (in *ChannelApplyListInp) Filter(ctx context.Context) (err error) {
	return
}

type ChannelApplyListModel struct {
	Id              int64       `json:"id" dc:"申请ID"`
	MemberId        int64       `json:"memberId" dc:"申请人ID"`
	ShopName        string      `json:"shopName" dc:"店铺名称"`
	Domain          string      `json:"domain" dc:"网站域名"`
	ChannelType     int         `json:"channelType" dc:"申请渠道类型"`
	ChannelFee      float64     `json:"channelFee" dc:"申请费用"`
	IdCardName      string      `json:"idCardName" dc:"身份证姓名"`
	IdCardNumber    string      `json:"idCardNumber" dc:"身份证号码"`
	IdCardFront     string      `json:"idCardFront" dc:"身份证正面照片"`
	IdCardBack      string      `json:"idCardBack" dc:"身份证反面照片"`
	BankCardNumber  string      `json:"bankCardNumber" dc:"银行卡号"`
	BankName        string      `json:"bankName" dc:"银行名称"`
	BankAccountName string      `json:"bankAccountName" dc:"银行账户姓名"`
	ApplyReason     string      `json:"applyReason" dc:"申请理由"`
	AuditStatus     int         `json:"auditStatus" dc:"审核状态"`
	AuditReason     string      `json:"auditReason" dc:"审核理由"`
	AuditTime       *gtime.Time `json:"auditTime" dc:"审核时间"`
	AuditUserId     int64       `json:"auditUserId" dc:"审核人ID"`
	Remark          string      `json:"remark" dc:"备注"`
	Status          int         `json:"status" dc:"状态"`
	CreatedAt       *gtime.Time `json:"createdAt" dc:"创建时间"`
	UpdatedAt       *gtime.Time `json:"updatedAt" dc:"更新时间"`
}

// ChannelApplyExportModel 导出支付渠道申请
type ChannelApplyExportModel struct {
	Id              int64       `json:"id" dc:"申请ID"`
	MemberId        int64       `json:"memberId" dc:"申请人ID"`
	ShopName        string      `json:"shopName" dc:"店铺名称"`
	Domain          string      `json:"domain" dc:"网站域名"`
	ChannelType     int         `json:"channelType" dc:"申请渠道类型"`
	ChannelFee      float64     `json:"channelFee" dc:"申请费用"`
	IdCardName      string      `json:"idCardName" dc:"身份证姓名"`
	IdCardNumber    string      `json:"idCardNumber" dc:"身份证号码"`
	BankCardNumber  string      `json:"bankCardNumber" dc:"银行卡号"`
	BankName        string      `json:"bankName" dc:"银行名称"`
	BankAccountName string      `json:"bankAccountName" dc:"银行账户姓名"`
	ApplyReason     string      `json:"applyReason" dc:"申请理由"`
	AuditStatus     int         `json:"auditStatus" dc:"审核状态"`
	AuditReason     string      `json:"auditReason" dc:"审核理由"`
	AuditTime       *gtime.Time `json:"auditTime" dc:"审核时间"`
	AuditUserId     int64       `json:"auditUserId" dc:"审核人ID"`
	Remark          string      `json:"remark" dc:"备注"`
	Status          int         `json:"status" dc:"状态"`
	CreatedAt       *gtime.Time `json:"createdAt" dc:"创建时间"`
	UpdatedAt       *gtime.Time `json:"updatedAt" dc:"更新时间"`
}

// ChannelApplyAuditInp 审核支付渠道申请
type ChannelApplyAuditInp struct {
	Id          int64  `json:"id" v:"required#申请ID不能为空" dc:"申请ID"`
	AuditStatus int    `json:"auditStatus" v:"required|in:2,3#审核状态不能为空|审核状态值错误" dc:"审核状态(2-审核通过, 3-审核拒绝)"`
	AuditReason string `json:"auditReason" v:"max-length:500#审核理由长度不能超过500字符" dc:"审核理由"`
}

func (in *ChannelApplyAuditInp) Filter(ctx context.Context) (err error) {
	return
}

type ChannelApplyAuditModel struct{}

// ChannelApplyStatusInp 更新支付渠道申请状态
type ChannelApplyStatusInp struct {
	Id     int64 `json:"id" v:"required#申请ID不能为空" dc:"申请ID"`
	Status int   `json:"status" v:"required|in:1,2#状态不能为空|状态值错误" dc:"状态(1-正常, 2-禁用)"`
}

func (in *ChannelApplyStatusInp) Filter(ctx context.Context) (err error) {
	return
}

type ChannelApplyStatusModel struct{}

// ChannelApplySwitchInp 更新支付渠道申请开关状态
type ChannelApplySwitchInp struct {
	form.SwitchReq
	Id int64 `json:"id" v:"required#申请ID不能为空" dc:"申请ID"`
}

func (in *ChannelApplySwitchInp) Filter(ctx context.Context) (err error) {
	return
}

type ChannelApplySwitchModel struct{}

// ChannelApplyMaxSortInp 获取支付渠道申请最大排序
type ChannelApplyMaxSortInp struct{}

func (in *ChannelApplyMaxSortInp) Filter(ctx context.Context) (err error) {
	return
}

type ChannelApplyMaxSortModel struct {
	Sort int `json:"sort" dc:"排序"`
}
