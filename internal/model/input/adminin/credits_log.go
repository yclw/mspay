package adminin

import (
	"context"

	"github.com/yclw/mspay/internal/model/input/form"

	"github.com/gogf/gf/v2/os/gtime"
)

// CreditsLogSaveBalanceInp 更新余额
type CreditsLogSaveBalanceInp struct {
	MemberId    int64   `json:"memberId"    dc:"管理员ID"`
	AppId       string  `json:"appId"       dc:"应用id"`
	AddonsName  string  `json:"addonsName"  dc:"插件名称"`
	CreditGroup string  `json:"creditGroup" dc:"变动的组别"`
	Num         float64 `json:"num"         dc:"变动数据"`
	Ip          string  `json:"ip"          dc:"操作人IP"`
	MapId       int64   `json:"mapId"       dc:"关联ID"`
	Remark      string  `json:"remark"      dc:"备注"`
}

func (in *CreditsLogSaveBalanceInp) Filter(ctx context.Context) (err error) {
	return
}

type CreditsLogSaveBalanceModel struct {
}

// CreditsLogSaveIntegralInp 更新积分
type CreditsLogSaveIntegralInp struct {
	MemberId    int64   `json:"memberId"    dc:"管理员ID"`
	AppId       string  `json:"appId"       dc:"应用id"`
	AddonsName  string  `json:"addonsName"  dc:"插件名称"`
	CreditGroup string  `json:"creditGroup" dc:"变动的组别"`
	Num         float64 `json:"num"         dc:"变动数据"`
	Ip          string  `json:"ip"          dc:"操作人IP"`
	MapId       int64   `json:"mapId"       dc:"关联ID"`
	Remark      string  `json:"remark"      dc:"备注"`
}

func (in *CreditsLogSaveIntegralInp) Filter(ctx context.Context) (err error) {
	return
}

type CreditsLogSaveIntegralModel struct {
}

// CreditsLogListInp 获取资产变动列表
type CreditsLogListInp struct {
	form.PageReq
	Id              int64         `json:"id"          dc:"变动ID"`
	MemberId        int64         `json:"memberId"    dc:"管理员ID"`
	AppId           string        `json:"appId"       dc:"应用id"`
	CreditType      string        `json:"creditType"  dc:"变动类型"`
	CreditGroup     string        `json:"creditGroup" dc:"变动的组别"`
	Remark          string        `json:"remark"      dc:"备注"`
	Ip              string        `json:"ip"          dc:"操作人IP"`
	Status          int           `json:"status"      dc:"状态"`
	CreatedAt       []*gtime.Time `json:"createdAt"   dc:"创建时间"`
	ComplexMemberId []string      `json:"complexMemberId" dc:"用户"`
}

func (in *CreditsLogListInp) Filter(ctx context.Context) (err error) {
	return
}

type CreditsLogListModel struct {
	Id          int64       `json:"id"          dc:"变动ID"`
	MemberId    int64       `json:"memberId"    dc:"管理员ID"`
	AppId       string      `json:"appId"       dc:"应用id"`
	AddonsName  string      `json:"addonsName"  dc:"插件名称"`
	CreditType  string      `json:"creditType"  dc:"变动类型"`
	CreditGroup string      `json:"creditGroup" dc:"变动的组别"`
	BeforeNum   float64     `json:"beforeNum"   dc:"变动前"`
	Num         float64     `json:"num"         dc:"变动数据"`
	AfterNum    float64     `json:"afterNum"    dc:"变动后"`
	Remark      string      `json:"remark"      dc:"备注"`
	Ip          string      `json:"ip"          dc:"操作人IP"`
	MapId       int64       `json:"mapId"       dc:"关联ID"`
	Status      int         `json:"status"      dc:"状态"`
	CreatedAt   *gtime.Time `json:"createdAt"   dc:"创建时间"`
	UpdatedAt   *gtime.Time `json:"updatedAt"   dc:"修改时间"`
}

// CreditsLogExportModel 导出资产变动
type CreditsLogExportModel struct {
	Id          int64       `json:"id"          dc:"变动ID"`
	MemberId    int64       `json:"memberId"    dc:"管理员ID"`
	AppId       string      `json:"appId"       dc:"应用id"`
	AddonsName  string      `json:"addonsName"  dc:"插件名称"`
	CreditType  string      `json:"creditType"  dc:"变动类型"`
	CreditGroup string      `json:"creditGroup" dc:"变动的组别"`
	BeforeNum   float64     `json:"beforeNum"   dc:"变动前"`
	Num         float64     `json:"num"         dc:"变动数据"`
	AfterNum    float64     `json:"afterNum"    dc:"变动后"`
	Remark      string      `json:"remark"      dc:"备注"`
	Ip          string      `json:"ip"          dc:"操作人IP"`
	MapId       int64       `json:"mapId"       dc:"关联ID"`
	Status      int         `json:"status"      dc:"状态"`
	CreatedAt   *gtime.Time `json:"createdAt"   dc:"创建时间"`
	UpdatedAt   *gtime.Time `json:"updatedAt"   dc:"修改时间"`
}
