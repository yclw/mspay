package message

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/yclw/mspay/internal/model/input/messagein"
)

// PullMessagesReq 拉取我的消息
type PullMessagesReq struct {
	g.Meta `path:"/notice/pullMessages" method:"get" tags:"公告" summary:"拉取我的消息"`
	messagein.PullMessagesInp
}

type PullMessagesRes struct {
	*messagein.PullMessagesModel
}
