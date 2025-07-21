package userin

import (
	"context"

	"github.com/yclw/mspay/internal/model/entity"
	"github.com/yclw/mspay/internal/model/input/form"
	"github.com/yclw/mspay/internal/model/input/loginin"

	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
)

// LoginMemberInfoModel 登录用户信息
type MemberInfoModel struct {
	Id          int64       `json:"id"                 dc:"用户ID"`
	RoleName    string      `json:"roleName"           dc:"所属角色"`
	Permissions []string    `json:"permissions"        dc:"角色信息"`
	RoleId      int64       `json:"-"                  dc:"角色ID"`
	Username    string      `json:"username"           dc:"用户名"`
	RealName    string      `json:"realName"           dc:"姓名"`
	Avatar      string      `json:"avatar"             dc:"头像"`
	Balance     float64     `json:"balance"            dc:"余额"`
	Integral    float64     `json:"integral"           dc:"积分"`
	Sex         int         `json:"sex"                dc:"性别"`
	Qq          string      `json:"qq"                 dc:"qq"`
	Email       string      `json:"email"              dc:"邮箱"`
	Mobile      string      `json:"mobile"             dc:"手机号码"`
	Birthday    *gtime.Time `json:"birthday"           dc:"生日"`
	CityId      int64       `json:"cityId"             dc:"城市编码"`
	Address     string      `json:"address"            dc:"联系地址"`
	CreatedAt   *gtime.Time `json:"createdAt"          dc:"创建时间"`
	OpenId      string      `json:"openId"             dc:"本次登录的openId"` // 区别与绑定的微信openid
	InviteCode  string      `json:"inviteCode"         dc:"邀请码"`
	*loginin.MemberLoginStatModel
}

// MemberListInp 获取用户列表
type MemberListInp struct {
	form.PageReq
	form.StatusReq
	Id        int64   `json:"id"         dc:"用户ID"`
	Pid       int64   `json:"pid"        dc:"上级ID"`
	RoleId    int     `json:"roleId"     dc:"角色ID"`
	Mobile    int     `json:"mobile"     dc:"手机号"`
	Username  string  `json:"username"   dc:"用户名"`
	RealName  string  `json:"realName"   dc:"真实姓名"`
	Name      string  `json:"name"       dc:"岗位名称"`
	Code      string  `json:"code"       dc:"岗位编码"`
	CreatedAt []int64 `json:"createdAt"  dc:"创建时间"`
}

type MemberListModel struct {
	entity.TMemberInfo
	RoleName string `json:"roleName"    dc:"所属角色"`
}

// MemberViewInp 获取用户信息
type MemberViewInp struct {
	Id int64 `json:"id" dc:"用户ID"`
}

type MemberViewModel struct {
	entity.TMemberInfo
}

// MemberEditInp 修改用户
type MemberEditInp struct {
	Id           int64       `json:"id"                                            dc:"管理员ID"`
	RoleId       int64       `json:"roleId"    v:"required#角色不能为空"            dc:"角色ID"`
	Username     string      `json:"username"   v:"required#账号不能为空"           dc:"帐号"`
	PasswordHash string      `json:"passwordHash"                                  dc:"密码hash"`
	Password     string      `json:"password"                                      dc:"密码"`
	RealName     string      `json:"realName"                                      dc:"真实姓名"`
	Avatar       string      `json:"avatar"                                        dc:"头像"`
	Sex          int         `json:"sex"                                           dc:"性别"`
	Qq           string      `json:"qq"                                            dc:"qq"`
	Email        string      `json:"email"                                         dc:"邮箱"`
	Birthday     *gtime.Time `json:"birthday"                                      dc:"生日"`
	ProvinceId   int         `json:"provinceId"                                    dc:"省"`
	CityId       int         `json:"cityId"                                        dc:"城市"`
	AreaId       int         `json:"areaId"                                        dc:"地区"`
	Address      string      `json:"address"                                       dc:"默认地址"`
	Mobile       string      `json:"mobile"                                        dc:"手机号码"`
	Remark       string      `json:"remark"                                        dc:"备注"`
	Status       int         `json:"status"                                        dc:"状态"`
}

func (in *MemberEditInp) Filter(ctx context.Context) (err error) {
	if in.Id < 1 || in.Password != "" {
		if err := g.Validator().
			Rules("length:6,16").
			Messages("新密码不能为空#新密码需在6~16之间").
			Data(in.Password).Run(ctx); err != nil {
			return err.Current()
		}
	}
	return
}

// MemberAddInp 新增用户
type MemberAddInp struct {
	*MemberEditInp
	Salt       string `json:"salt"               dc:"密码盐"`
	Pid        int64  `json:"pid"                dc:"上级ID"`
	Level      int    `json:"level"              dc:"等级"`
	Tree       string `json:"tree"               dc:"关系树"`
	InviteCode string `json:"inviteCode"         dc:"邀请码"`
}

// MemberDeleteInp 删除用户
type MemberDeleteInp struct {
	Id interface{} `json:"id" v:"required#用户ID不能为空" dc:"用户ID"`
}
