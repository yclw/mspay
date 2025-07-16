// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// PayChannelApplyDao is the data access object for the table hg_pay_channel_apply.
type PayChannelApplyDao struct {
	table    string                 // table is the underlying table name of the DAO.
	group    string                 // group is the database configuration group name of the current DAO.
	columns  PayChannelApplyColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler     // handlers for customized model modification.
}

// PayChannelApplyColumns defines and stores column names for the table hg_pay_channel_apply.
type PayChannelApplyColumns struct {
	Id              string // 主键ID
	MemberId        string // 申请人ID
	ShopName        string // 店铺名称
	Domain          string // 网站域名
	ChannelType     string // 申请渠道类型(1-微信个人支付, 2-支付宝个人支付)
	ChannelFee      string // 申请费用
	IdCardName      string // 身份证姓名
	IdCardNumber    string // 身份证号码
	IdCardFront     string // 身份证正面照片
	IdCardBack      string // 身份证反面照片
	BankCardNumber  string // 银行卡号
	BankName        string // 银行名称
	BankAccountName string // 银行账户姓名
	ApplyReason     string // 申请理由
	AuditStatus     string // 审核状态(1-待审核, 2-审核通过, 3-审核拒绝)
	AuditReason     string // 审核理由
	AuditTime       string // 审核时间
	AuditUserId     string // 审核人ID
	Remark          string // 备注
	Status          string // 状态(1-正常, 2-禁用)
	CreatedAt       string // 创建时间
	UpdatedAt       string // 更新时间
}

// payChannelApplyColumns holds the columns for the table hg_pay_channel_apply.
var payChannelApplyColumns = PayChannelApplyColumns{
	Id:              "id",
	MemberId:        "member_id",
	ShopName:        "shop_name",
	Domain:          "domain",
	ChannelType:     "channel_type",
	ChannelFee:      "channel_fee",
	IdCardName:      "id_card_name",
	IdCardNumber:    "id_card_number",
	IdCardFront:     "id_card_front",
	IdCardBack:      "id_card_back",
	BankCardNumber:  "bank_card_number",
	BankName:        "bank_name",
	BankAccountName: "bank_account_name",
	ApplyReason:     "apply_reason",
	AuditStatus:     "audit_status",
	AuditReason:     "audit_reason",
	AuditTime:       "audit_time",
	AuditUserId:     "audit_user_id",
	Remark:          "remark",
	Status:          "status",
	CreatedAt:       "created_at",
	UpdatedAt:       "updated_at",
}

// NewPayChannelApplyDao creates and returns a new DAO object for table data access.
func NewPayChannelApplyDao(handlers ...gdb.ModelHandler) *PayChannelApplyDao {
	return &PayChannelApplyDao{
		group:    "default",
		table:    "hg_pay_channel_apply",
		columns:  payChannelApplyColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *PayChannelApplyDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *PayChannelApplyDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *PayChannelApplyDao) Columns() PayChannelApplyColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *PayChannelApplyDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *PayChannelApplyDao) Ctx(ctx context.Context) *gdb.Model {
	model := dao.DB().Model(dao.table)
	for _, handler := range dao.handlers {
		model = handler(model)
	}
	return model.Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rolls back the transaction and returns the error if function f returns a non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note: Do not commit or roll back the transaction in function f,
// as it is automatically handled by this function.
func (dao *PayChannelApplyDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
