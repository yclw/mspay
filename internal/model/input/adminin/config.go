package adminin

// 后台配置.

// BasicConfig 基础配置
type BasicConfig struct {
	CaptchaSwitch  int    `json:"basicCaptchaSwitch"`
	CloseText      string `json:"basicCloseText"`
	Copyright      string `json:"basicCopyright"`
	IcpCode        string `json:"basicIcpCode"`
	Logo           string `json:"basicLogo"`
	Name           string `json:"basicName"`
	Domain         string `json:"basicDomain"`
	WsAddr         string `json:"basicWsAddr"`
	RegisterSwitch int    `json:"basicRegisterSwitch"`
	SystemOpen     bool   `json:"basicSystemOpen"`
}

// EmailTemplate 邮件模板
type EmailTemplate struct {
	Key   string `json:"key"`
	Value string `json:"value"`
}

// EmailConfig 邮箱配置
type EmailConfig struct {
	User         string           `json:"smtpUser"`
	Password     string           `json:"smtpPass"`
	Addr         string           `json:"smtpAddr"`
	Host         string           `json:"smtpHost"`
	Port         int64            `json:"smtpPort"`
	SendName     string           `json:"smtpSendName"`
	AdminMailbox string           `json:"smtpAdminMailbox"`
	MinInterval  int              `json:"smtpMinInterval"`
	MaxIpLimit   int              `json:"smtpMaxIpLimit"`
	CodeExpire   int              `json:"smtpCodeExpire"`
	Template     []*EmailTemplate `json:"smtpTemplate"`
}

// CashConfig 提现配置
type CashConfig struct {
	Switch      bool    `json:"cashSwitch"`
	MinFee      float64 `json:"cashMinFee"`
	MinFeeRatio float64 `json:"cashMinFeeRatio"`
	MinMoney    float64 `json:"cashMinMoney"`
	Tips        string  `json:"cashTips"`
}

// SmsTemplate 短信模板
type SmsTemplate struct {
	Key   string `json:"key"`
	Value string `json:"value"`
}

// SmsConfig 短信配置
type SmsConfig struct {
	// 基础
	SmsDrive       string `json:"smsDrive"`
	SmsMinInterval int    `json:"smsMinInterval"`
	SmsMaxIpLimit  int    `json:"smsMaxIpLimit"`
	SmsCodeExpire  int    `json:"smsCodeExpire"`
	// 阿里云
	AliYunAccessKeyID     string         `json:"smsAliYunAccessKeyID"`
	AliYunAccessKeySecret string         `json:"smsAliYunAccessKeySecret"`
	AliYunSign            string         `json:"smsAliYunSign"`
	AliYunTemplate        []*SmsTemplate `json:"smsAliYunTemplate"`
	// 腾讯云
	TencentSecretId  string         `json:"smsTencentSecretId"`
	TencentSecretKey string         `json:"smsTencentSecretKey"`
	TencentEndpoint  string         `json:"smsTencentEndpoint"`
	TencentRegion    string         `json:"smsTencentRegion"`
	TencentAppId     string         `json:"smsTencentAppId"`
	TencentSign      string         `json:"smsTencentSign"`
	TencentTemplate  []*SmsTemplate `json:"smsTencentTemplate"`
}

type PayConfig struct {
	Debug bool `json:"payDebug"`
	// 支付宝
	AliPayAppId             string `json:"payAliPayAppId"`
	AliPayPrivateKey        string `json:"payAliPayPrivateKey"`
	AliPayAppCertPublicKey  string `json:"payAliPayAppCertPublicKey"`
	AliPayRootCert          string `json:"payAliPayRootCert"`
	AliPayCertPublicKeyRSA2 string `json:"payAliPayCertPublicKeyRSA2"`
	// 微信支付
	WxPayAppId      string `json:"payWxPayAppId"`
	WxPayMchId      string `json:"payWxPayMchId"`
	WxPaySerialNo   string `json:"payWxPaySerialNo"`
	WxPayAPIv3Key   string `json:"payWxPayAPIv3Key"`
	WxPayPrivateKey string `json:"payWxPayPrivateKey"`
	// QQ支付
	QQPayAppId  string `json:"payQQPayAppId"`
	QQPayMchId  string `json:"payQQPayMchId"`
	QQPayApiKey string `json:"payQQPayApiKey"`
}

// WechatOfficialAccountConfig 微信公众号配置
type WechatOfficialAccountConfig struct {
	OfficialAppID          string `json:"officialAccountAppId"`          // appid
	OfficialAppSecret      string `json:"officialAccountAppSecret"`      // app secret
	OfficialToken          string `json:"officialAccountToken"`          // token
	OfficialEncodingAESKey string `json:"officialAccountEncodingAESKey"` // EncodingAESKey
}

// WechatOpenPlatformConfig 微信开放平台配置
type WechatOpenPlatformConfig struct {
	OpenAppID          string `json:"openPlatformAppId"`          // appid
	OpenAppSecret      string `json:"openPlatformAppSecret"`      // app secret
	OpenToken          string `json:"openPlatformToken"`          // token
	OpenEncodingAESKey string `json:"openPlatformEncodingAESKey"` // EncodingAESKey
}

// WechatConfig 微信配置
type WechatConfig struct {
	*WechatOfficialAccountConfig
	*WechatOpenPlatformConfig
}

// LoginConfig 登录配置
type LoginConfig struct {
	RegisterSwitch int     `json:"loginRegisterSwitch"` // 注册开关
	CaptchaSwitch  int     `json:"loginCaptchaSwitch"`  // 验证码开关
	CaptchaType    int     `json:"loginCaptchaType"`    // 验证码类型
	Avatar         string  `json:"loginAvatar"`         // 头像
	RoleId         int64   `json:"loginRoleId"`         // 角色ID
	DeptId         int64   `json:"loginDeptId"`         // 部门ID
	PostIds        []int64 `json:"loginPostIds"`        // 岗位ID
	Protocol       string  `json:"loginProtocol"`       // 协议
	Policy         string  `json:"loginPolicy"`         // 政策
	AutoOpenId     int     `json:"loginAutoOpenId"`     // 自动OpenId
	ForceInvite    int     `json:"loginForceInvite"`    // 强制邀请
}
