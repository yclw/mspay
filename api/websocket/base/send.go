package base

import (
	"github.com/yclw/mspay/internal/model/input/websocketin"
	
	"github.com/gogf/gf/v2/frame/g"
)

// SendToTagReq 发送标签消息
type SendToTagReq struct {
	g.Meta `path:"/send/toTag" method:"post" tags:"WebSocket" summary:"发送标签消息"`
	websocketin.SendToTagInp
}

type SendToTagRes struct {
}
