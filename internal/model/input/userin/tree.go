package userin

import "github.com/yclw/mspay/internal/model/entity"

// DefaultTree 默认树表字段
type DefaultTree struct {
	Id    int64  `json:"id"             description:"ID"`
	Pid   int64  `json:"pid"            description:"父ID"`
	Level int    `json:"level"          description:"关系树等级"`
	Tree  string `json:"tree"           description:"关系树"`
}

// TreeMenu 菜单树
type TreeMenu struct {
	entity.TMenuInfo
	Children []*TreeMenu `json:"children"`
}

// LabelTreeMenu 菜单kv树
type LabelTreeMenu struct {
	entity.TMenuInfo
	Key      int64            `json:"key"       description:"键名"`
	Label    string           `json:"label"       description:"键标签"`
	Children []*LabelTreeMenu `json:"children"`
}
