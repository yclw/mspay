package messagein

import (
	"context"

	"github.com/gogf/gf/v2/os/gtime"
)

type PullMessagesRow struct {
	Id           int64       `json:"id"           dc:"消息ID"`
	Type         int64       `json:"type"         dc:"消息类型"`
	Title        string      `json:"title"        dc:"消息标题"`
	Content      string      `json:"content"      dc:"消息内容"`
	Tag          int64       `json:"tag"          dc:"标签"`
	Sort         int64       `json:"sort"         dc:"排序"`
	CreatedBy    int64       `json:"createdBy"    dc:"发送人"`
	CreatedAt    *gtime.Time `json:"createdAt"    dc:"创建时间"`
	SenderAvatar string      `json:"senderAvatar" dc:"发送者头像"`
	IsRead       bool        `json:"isRead"       dc:"是否已读"`
}

type NoticeUnreadCountModel struct {
	NotifyCount int `json:"notifyCount" dc:"未读通知数量"`
	NoticeCount int `json:"noticeCount" dc:"未读公告数量"`
	LetterCount int `json:"letterCount" dc:"未读私信数量"`
}

// PullMessagesInp 获取列表
type PullMessagesInp struct {
	Limit int `json:"limit" dc:"拉取最大数量限制"`
}

func (in *PullMessagesInp) Filter(ctx context.Context) (err error) {
	if in.Limit == 0 {
		in.Limit = 100
	}
	return
}

type PullMessagesModel struct {
	List []*PullMessagesRow `json:"list" dc:"消息列表"`
	*NoticeUnreadCountModel
}
