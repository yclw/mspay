package websocketin

// WResponse 输出对象
type WResponse struct {
	Event     string      `json:"event"`              // 事件名称
	Data      interface{} `json:"data,omitempty"`     // 数据
	Code      int         `json:"code"`               // 状态码
	ErrorMsg  string      `json:"errorMsg,omitempty"` // 错误消息
	Timestamp int64       `json:"timestamp"`          // 服务器时间
}

// SendToTagInp 发送标签消息
type SendToTagInp struct {
	Tag      string    `json:"tag" v:"required#tag不能为空" description:"标签"`
	Response WResponse `json:"response" v:"required#response不能为空"  description:"响应内容"`
}
