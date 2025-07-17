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

// PayChannelApplyUpdateFields 修改支付渠道申请字段过滤
type PayChannelApplyUpdateFields struct {
	ShopName        string `json:"shopName"        dc:"店铺名称"`
	Domain          string `json:"domain"          dc:"网站域名"`
	ChannelType     int    `json:"channelType"     dc:"申请渠道类型"`
	IdCardName      string `json:"idCardName"      dc:"身份证姓名"`
	IdCardNumber    string `json:"idCardNumber"    dc:"身份证号码"`
	IdCardFront     string `json:"idCardFront"     dc:"身份证正面照片"`
	IdCardBack      string `json:"idCardBack"      dc:"身份证反面照片"`
	BankCardNumber  string `json:"bankCardNumber"  dc:"银行卡号"`
	BankName        string `json:"bankName"        dc:"银行名称"`
	BankAccountName string `json:"bankAccountName" dc:"银行账户姓名"`
	ApplyReason     string `json:"applyReason"     dc:"申请理由"`
	Remark          string `json:"remark"          dc:"备注"`
	Status          int    `json:"status"          dc:"状态"`
}

// PayChannelApplyInsertFields 新增支付渠道申请字段过滤
type PayChannelApplyInsertFields struct {
	ShopName        string `json:"shopName"        dc:"店铺名称"`
	Domain          string `json:"domain"          dc:"网站域名"`
	ChannelType     int    `json:"channelType"     dc:"申请渠道类型"`
	IdCardName      string `json:"idCardName"      dc:"身份证姓名"`
	IdCardNumber    string `json:"idCardNumber"    dc:"身份证号码"`
	IdCardFront     string `json:"idCardFront"     dc:"身份证正面照片"`
	IdCardBack      string `json:"idCardBack"      dc:"身份证反面照片"`
	BankCardNumber  string `json:"bankCardNumber"  dc:"银行卡号"`
	BankName        string `json:"bankName"        dc:"银行名称"`
	BankAccountName string `json:"bankAccountName" dc:"银行账户姓名"`
	ApplyReason     string `json:"applyReason"     dc:"申请理由"`
	Remark          string `json:"remark"          dc:"备注"`
	Status          int    `json:"status"          dc:"状态"`
}

// PayChannelApplyEditInp 修改/新增支付渠道申请
type PayChannelApplyEditInp struct {
	entity.PayChannelApply
}

func (in *PayChannelApplyEditInp) Filter(ctx context.Context) (err error) {
	// 验证店铺名称
	if err := g.Validator().Rules("required").Data(in.ShopName).Messages("店铺名称不能为空").Run(ctx); err != nil {
		return err.Current()
	}

	// 验证网站域名
	if err := g.Validator().Rules("required").Data(in.Domain).Messages("网站域名不能为空").Run(ctx); err != nil {
		return err.Current()
	}

	// 验证申请渠道类型
	if err := g.Validator().Rules("required").Data(in.ChannelType).Messages("申请渠道类型不能为空").Run(ctx); err != nil {
		return err.Current()
	}
	if err := g.Validator().Rules("in:1").Data(in.ChannelType).Messages("申请渠道类型值不正确").Run(ctx); err != nil {
		return err.Current()
	}

	// 验证身份证姓名
	if err := g.Validator().Rules("required").Data(in.IdCardName).Messages("身份证姓名不能为空").Run(ctx); err != nil {
		return err.Current()
	}

	// 验证身份证号码
	if err := g.Validator().Rules("resident-id").Data(in.IdCardNumber).Messages("身份证号码不是身份证号码").Run(ctx); err != nil {
		return err.Current()
	}

	// 验证身份证正面照片
	if err := g.Validator().Rules("required").Data(in.IdCardFront).Messages("身份证正面照片不能为空").Run(ctx); err != nil {
		return err.Current()
	}

	// 验证身份证反面照片
	if err := g.Validator().Rules("required").Data(in.IdCardBack).Messages("身份证反面照片不能为空").Run(ctx); err != nil {
		return err.Current()
	}

	// 验证银行卡号
	if err := g.Validator().Rules("bank-card").Data(in.BankCardNumber).Messages("银行卡号不是银行卡号").Run(ctx); err != nil {
		return err.Current()
	}

	// 验证银行名称
	if err := g.Validator().Rules("required").Data(in.BankName).Messages("银行名称不能为空").Run(ctx); err != nil {
		return err.Current()
	}

	// 验证银行账户姓名
	if err := g.Validator().Rules("required").Data(in.BankAccountName).Messages("银行账户姓名不能为空").Run(ctx); err != nil {
		return err.Current()
	}

	// 验证状态
	if err := g.Validator().Rules("required").Data(in.Status).Messages("状态不能为空").Run(ctx); err != nil {
		return err.Current()
	}
	if err := g.Validator().Rules("in:1,2").Data(in.Status).Messages("状态值不正确").Run(ctx); err != nil {
		return err.Current()
	}

	return
}

type PayChannelApplyEditModel struct{}

// PayChannelApplyDeleteInp 删除支付渠道申请
type PayChannelApplyDeleteInp struct {
	Id interface{} `json:"id" v:"required#主键ID不能为空" dc:"主键ID"`
}

func (in *PayChannelApplyDeleteInp) Filter(ctx context.Context) (err error) {
	return
}

type PayChannelApplyDeleteModel struct{}

// PayChannelApplyViewInp 获取指定支付渠道申请信息
type PayChannelApplyViewInp struct {
	Id int64 `json:"id" v:"required#主键ID不能为空" dc:"主键ID"`
}

func (in *PayChannelApplyViewInp) Filter(ctx context.Context) (err error) {
	return
}

type PayChannelApplyViewModel struct {
	entity.PayChannelApply
}

// PayChannelApplyListInp 获取支付渠道申请列表
type PayChannelApplyListInp struct {
	form.PageReq
	ShopName    string `json:"shopName"    dc:"店铺名称"`
	Domain      string `json:"domain"      dc:"网站域名"`
	ChannelType int    `json:"channelType" dc:"申请渠道类型"`
	Remark      string `json:"remark"      dc:"备注"`
	Status      int    `json:"status"      dc:"状态"`
}

func (in *PayChannelApplyListInp) Filter(ctx context.Context) (err error) {
	return
}

type PayChannelApplyListModel struct {
	Id          int64       `json:"id"          dc:"主键ID"`
	ShopName    string      `json:"shopName"    dc:"店铺名称"`
	Domain      string      `json:"domain"      dc:"网站域名"`
	ChannelType int         `json:"channelType" dc:"申请渠道类型"`
	AuditStatus int         `json:"auditStatus" dc:"审核状态"`
	AuditTime   *gtime.Time `json:"auditTime"   dc:"审核时间"`
	Status      int         `json:"status"      dc:"状态"`
}

// PayChannelApplyStatusInp 更新支付渠道申请状态
type PayChannelApplyStatusInp struct {
	Id     int64 `json:"id" v:"required#主键ID不能为空" dc:"主键ID"`
	Status int   `json:"status" dc:"状态"`
}

func (in *PayChannelApplyStatusInp) Filter(ctx context.Context) (err error) {
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

type PayChannelApplyStatusModel struct{}
