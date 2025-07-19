package userin

import (
	"github.com/yclw/mspay/internal/model/input/loginin"

	"github.com/gogf/gf/v2/os/gtime"
)

type LoginMemberInfoModel struct {
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
