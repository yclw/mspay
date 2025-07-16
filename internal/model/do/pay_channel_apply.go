// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
)

// PayChannelApply is the golang structure of table hg_pay_channel_apply for DAO operations like Where/Data.
type PayChannelApply struct {
	g.Meta          `orm:"table:hg_pay_channel_apply, do:true"`
	Id              interface{} // 主键ID
	MemberId        interface{} // 申请人ID
	ShopName        interface{} // 店铺名称
	Domain          interface{} // 网站域名
	ChannelType     interface{} // 申请渠道类型(1-微信个人支付, 2-支付宝个人支付)
	ChannelFee      interface{} // 申请费用
	IdCardName      interface{} // 身份证姓名
	IdCardNumber    interface{} // 身份证号码
	IdCardFront     interface{} // 身份证正面照片
	IdCardBack      interface{} // 身份证反面照片
	BankCardNumber  interface{} // 银行卡号
	BankName        interface{} // 银行名称
	BankAccountName interface{} // 银行账户姓名
	ApplyReason     interface{} // 申请理由
	AuditStatus     interface{} // 审核状态(1-待审核, 2-审核通过, 3-审核拒绝)
	AuditReason     interface{} // 审核理由
	AuditTime       *gtime.Time // 审核时间
	AuditUserId     interface{} // 审核人ID
	Remark          interface{} // 备注
	Status          interface{} // 状态(1-正常, 2-禁用)
	CreatedAt       *gtime.Time // 创建时间
	UpdatedAt       *gtime.Time // 更新时间
}
