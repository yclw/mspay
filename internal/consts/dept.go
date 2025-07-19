package consts

const (
	DeptTypeCompany  = "company"  // 公司
	DeptTypeTenant   = "tenant"   // 租户
	DeptTypeMerchant = "merchant" // 商户
	DeptTypeUser     = "user"     // 用户
)

// GroupScopeSelect 部门选择
type GroupScopeSelect struct {
	Type     string        `json:"type,omitempty"`
	Label    string        `json:"label"`
	Key      int           `json:"key"`
	Value    int           `json:"value,omitempty"`
	Children []ScopeSelect `json:"children,omitempty"`
}

// ScopeSelect 部门选择
type ScopeSelect struct {
	Label string `json:"label"`
	Value int    `json:"value"`
}
