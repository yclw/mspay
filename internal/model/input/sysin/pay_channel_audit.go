// Package sysin
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2025 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
// @AutoGenerate Version 2.17.8
package sysin

import (
	"context"

	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/internal/model/entity"
	"github.com/yclw/mspay/internal/model/input/form"
	"github.com/yclw/mspay/util/validate"

	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
)

// PayChannelAuditUpdateFields 修改支付渠道审核字段过滤
type PayChannelAuditUpdateFields struct {
	AuditStatus int    `json:"auditStatus" dc:"审核状态"`
	AuditReason string `json:"auditReason" dc:"审核理由"`
	AuditUserId int64  `json:"auditUserId" dc:"审核人ID"`
}

// PayChannelAuditInsertFields 新增支付渠道审核字段过滤
type PayChannelAuditInsertFields struct {
	AuditStatus int    `json:"auditStatus" dc:"审核状态"`
	AuditReason string `json:"auditReason" dc:"审核理由"`
	AuditUserId int64  `json:"auditUserId" dc:"审核人ID"`
}

// PayChannelAuditEditInp 修改/新增支付渠道审核
type PayChannelAuditEditInp struct {
	entity.PayChannelApply
}

func (in *PayChannelAuditEditInp) Filter(ctx context.Context) (err error) {
	// 验证审核状态
	if err := g.Validator().Rules("required").Data(in.AuditStatus).Messages("审核状态不能为空").Run(ctx); err != nil {
		return err.Current()
	}
	if err := g.Validator().Rules("in:3,2,1,4,5,6").Data(in.AuditStatus).Messages("审核状态值不正确").Run(ctx); err != nil {
		return err.Current()
	}

	// 验证审核理由
	if err := g.Validator().Rules("required").Data(in.AuditReason).Messages("审核理由不能为空").Run(ctx); err != nil {
		return err.Current()
	}

	// 验证审核人ID
	if err := g.Validator().Rules("required").Data(in.AuditUserId).Messages("审核人ID不能为空").Run(ctx); err != nil {
		return err.Current()
	}
	if err := g.Validator().Rules("in:1").Data(in.AuditUserId).Messages("审核人ID值不正确").Run(ctx); err != nil {
		return err.Current()
	}

	return
}

type PayChannelAuditEditModel struct{}

// PayChannelAuditDeleteInp 删除支付渠道审核
type PayChannelAuditDeleteInp struct {
	Id interface{} `json:"id" v:"required#主键ID不能为空" dc:"主键ID"`
}

func (in *PayChannelAuditDeleteInp) Filter(ctx context.Context) (err error) {
	return
}

type PayChannelAuditDeleteModel struct{}

// PayChannelAuditViewInp 获取指定支付渠道审核信息
type PayChannelAuditViewInp struct {
	Id int64 `json:"id" v:"required#主键ID不能为空" dc:"主键ID"`
}

func (in *PayChannelAuditViewInp) Filter(ctx context.Context) (err error) {
	return
}

type PayChannelAuditViewModel struct {
	entity.PayChannelApply
}

// PayChannelAuditListInp 获取支付渠道审核列表
type PayChannelAuditListInp struct {
	form.PageReq
	Id              int64         `json:"id"              dc:"主键ID"`
	MemberId        int64         `json:"memberId"        dc:"申请人ID"`
	ShopName        string        `json:"shopName"        dc:"店铺名称"`
	Domain          string        `json:"domain"          dc:"网站域名"`
	ChannelType     int           `json:"channelType"     dc:"申请渠道类型"`
	IdCardName      string        `json:"idCardName"      dc:"身份证姓名"`
	IdCardNumber    string        `json:"idCardNumber"    dc:"身份证号码"`
	BankCardNumber  string        `json:"bankCardNumber"  dc:"银行卡号"`
	BankName        string        `json:"bankName"        dc:"银行名称"`
	BankAccountName string        `json:"bankAccountName" dc:"银行账户姓名"`
	ApplyReason     string        `json:"applyReason"     dc:"申请理由"`
	AuditStatus     int           `json:"auditStatus"     dc:"审核状态"`
	AuditReason     string        `json:"auditReason"     dc:"审核理由"`
	AuditTime       []*gtime.Time `json:"auditTime"       dc:"审核时间"`
	AuditUserId     int64         `json:"auditUserId"     dc:"审核人ID"`
	Status          int           `json:"status"          dc:"状态"`
	CreatedAt       []*gtime.Time `json:"createdAt"       dc:"创建时间"`
	UpdatedAt       *gtime.Time   `json:"updatedAt"       dc:"更新时间"`
}

func (in *PayChannelAuditListInp) Filter(ctx context.Context) (err error) {
	return
}

type PayChannelAuditListModel struct {
	Id              int64       `json:"id"              dc:"主键ID"`
	MemberId        int64       `json:"memberId"        dc:"申请人ID"`
	ShopName        string      `json:"shopName"        dc:"店铺名称"`
	Domain          string      `json:"domain"          dc:"网站域名"`
	ChannelType     int         `json:"channelType"     dc:"申请渠道类型"`
	IdCardName      string      `json:"idCardName"      dc:"身份证姓名"`
	IdCardNumber    string      `json:"idCardNumber"    dc:"身份证号码"`
	IdCardFront     string      `json:"idCardFront"     dc:"身份证正面照片"`
	IdCardBack      string      `json:"idCardBack"      dc:"身份证反面照片"`
	BankCardNumber  string      `json:"bankCardNumber"  dc:"银行卡号"`
	BankName        string      `json:"bankName"        dc:"银行名称"`
	BankAccountName string      `json:"bankAccountName" dc:"银行账户姓名"`
	ApplyReason     string      `json:"applyReason"     dc:"申请理由"`
	AuditStatus     int         `json:"auditStatus"     dc:"审核状态"`
	AuditReason     string      `json:"auditReason"     dc:"审核理由"`
	AuditTime       *gtime.Time `json:"auditTime"       dc:"审核时间"`
	AuditUserId     int64       `json:"auditUserId"     dc:"审核人ID"`
	Remark          string      `json:"remark"          dc:"备注"`
	Status          int         `json:"status"          dc:"状态"`
	CreatedAt       *gtime.Time `json:"createdAt"       dc:"创建时间"`
	UpdatedAt       *gtime.Time `json:"updatedAt"       dc:"更新时间"`
}

// PayChannelAuditExportModel 导出支付渠道审核
type PayChannelAuditExportModel struct {
	Id              int64       `json:"id"              dc:"主键ID"`
	MemberId        int64       `json:"memberId"        dc:"申请人ID"`
	ShopName        string      `json:"shopName"        dc:"店铺名称"`
	Domain          string      `json:"domain"          dc:"网站域名"`
	ChannelType     int         `json:"channelType"     dc:"申请渠道类型"`
	IdCardName      string      `json:"idCardName"      dc:"身份证姓名"`
	IdCardNumber    string      `json:"idCardNumber"    dc:"身份证号码"`
	IdCardFront     string      `json:"idCardFront"     dc:"身份证正面照片"`
	IdCardBack      string      `json:"idCardBack"      dc:"身份证反面照片"`
	BankCardNumber  string      `json:"bankCardNumber"  dc:"银行卡号"`
	BankName        string      `json:"bankName"        dc:"银行名称"`
	BankAccountName string      `json:"bankAccountName" dc:"银行账户姓名"`
	ApplyReason     string      `json:"applyReason"     dc:"申请理由"`
	AuditStatus     int         `json:"auditStatus"     dc:"审核状态"`
	AuditReason     string      `json:"auditReason"     dc:"审核理由"`
	AuditTime       *gtime.Time `json:"auditTime"       dc:"审核时间"`
	AuditUserId     int64       `json:"auditUserId"     dc:"审核人ID"`
	Remark          string      `json:"remark"          dc:"备注"`
	Status          int         `json:"status"          dc:"状态"`
	CreatedAt       *gtime.Time `json:"createdAt"       dc:"创建时间"`
	UpdatedAt       *gtime.Time `json:"updatedAt"       dc:"更新时间"`
}

// PayChannelAuditStatusInp 更新支付渠道审核状态
type PayChannelAuditStatusInp struct {
	Id     int64 `json:"id" v:"required#主键ID不能为空" dc:"主键ID"`
	Status int   `json:"status" dc:"状态"`
}

func (in *PayChannelAuditStatusInp) Filter(ctx context.Context) (err error) {
	if in.Id <= 0 {
		err = gerror.New("主键ID不能为空")
		return
	}

	if in.Status <= 0 {
		err = gerror.New("状态不能为空")
		return
	}

	if !validate.InSlice(consts.StatusSlice, in.Status) {
		err = gerror.New("状态不正确")
		return
	}
	return
}

type PayChannelAuditStatusModel struct{}
