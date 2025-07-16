// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

import (
	"github.com/gogf/gf/v2/os/gtime"
)

// PayChannelApply is the golang structure for table pay_channel_apply.
type PayChannelApply struct {
	Id              int64       `json:"id"              orm:"id"                description:"主键ID"`
	MemberId        int64       `json:"memberId"        orm:"member_id"         description:"申请人ID"`
	ShopName        string      `json:"shopName"        orm:"shop_name"         description:"店铺名称"`
	Domain          string      `json:"domain"          orm:"domain"            description:"网站域名"`
	ChannelType     int         `json:"channelType"     orm:"channel_type"      description:"申请渠道类型(1-微信个人支付, 2-支付宝个人支付)"`
	ChannelFee      float64     `json:"channelFee"      orm:"channel_fee"       description:"申请费用"`
	IdCardName      string      `json:"idCardName"      orm:"id_card_name"      description:"身份证姓名"`
	IdCardNumber    string      `json:"idCardNumber"    orm:"id_card_number"    description:"身份证号码"`
	IdCardFront     string      `json:"idCardFront"     orm:"id_card_front"     description:"身份证正面照片"`
	IdCardBack      string      `json:"idCardBack"      orm:"id_card_back"      description:"身份证反面照片"`
	BankCardNumber  string      `json:"bankCardNumber"  orm:"bank_card_number"  description:"银行卡号"`
	BankName        string      `json:"bankName"        orm:"bank_name"         description:"银行名称"`
	BankAccountName string      `json:"bankAccountName" orm:"bank_account_name" description:"银行账户姓名"`
	ApplyReason     string      `json:"applyReason"     orm:"apply_reason"      description:"申请理由"`
	AuditStatus     int         `json:"auditStatus"     orm:"audit_status"      description:"审核状态(1-待审核, 2-审核通过, 3-审核拒绝)"`
	AuditReason     string      `json:"auditReason"     orm:"audit_reason"      description:"审核理由"`
	AuditTime       *gtime.Time `json:"auditTime"       orm:"audit_time"        description:"审核时间"`
	AuditUserId     int64       `json:"auditUserId"     orm:"audit_user_id"     description:"审核人ID"`
	Remark          string      `json:"remark"          orm:"remark"            description:"备注"`
	Status          int         `json:"status"          orm:"status"            description:"状态(1-正常, 2-禁用)"`
	CreatedAt       *gtime.Time `json:"createdAt"       orm:"created_at"        description:"创建时间"`
	UpdatedAt       *gtime.Time `json:"updatedAt"       orm:"updated_at"        description:"更新时间"`
}
