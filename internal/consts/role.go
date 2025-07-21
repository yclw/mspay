package consts

import "github.com/yclw/mspay/internal/model/input/commonin"

// 数据范围
const (
	RoleDataAll = 1 // 全部权限

	// 通过上下级关系划分
	RoleDataSelf          = 2 // 仅自己
	RoleDataSelfAndSub    = 3 // 自己和直属下级
	RoleDataSelfAndAllSub = 4 // 自己和全部下级
)

var RoleDataNameMap = map[int]string{
	RoleDataAll:           "全部权限",
	RoleDataSelf:          "仅自己",
	RoleDataSelfAndSub:    "自己和直属下级",
	RoleDataSelfAndAllSub: "自己和全部下级",
}

var DataScopeSelect = []commonin.GroupScopeSelect{
	{
		Label: RoleDataNameMap[RoleDataAll],
		Key:   RoleDataAll,
		Value: RoleDataAll,
	},
	{
		Type:  "group",
		Label: "按上下级关系划分",
		Key:   -2,
		Children: []commonin.ScopeSelect{
			{
				Label: RoleDataNameMap[RoleDataSelf],
				Value: RoleDataSelf,
			},
			{
				Label: RoleDataNameMap[RoleDataSelfAndSub],
				Value: RoleDataSelfAndSub,
			},
			{
				Label: RoleDataNameMap[RoleDataSelfAndAllSub],
				Value: RoleDataSelfAndAllSub,
			},
		},
	},
}
