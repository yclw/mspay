package contexts

import (
	"context"
	"time"
)

// detached 分离上下文
type detached struct {
	ctx context.Context
}

// Deadline 实现 context.Context 接口
func (detached) Deadline() (time.Time, bool) {
	return time.Time{}, false
}

// Done 实现 context.Context 接口
func (detached) Done() <-chan struct{} {
	return nil
}

// Err 实现 context.Context 接口
func (detached) Err() error {
	return nil
}

// Value 实现 context.Context 接口
func (d detached) Value(key interface{}) interface{} {
	return d.ctx.Value(key)
}

// Detach 分离上下文
func Detach(ctx context.Context) context.Context {
	return detached{ctx: ctx}
}
