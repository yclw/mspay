package hook

import (
	"github.com/gogf/gf/v2/net/ghttp"
)

var Hook = New()

type cHook struct {
}

func New() *cHook {
	return &cHook{}
}

// BeforeServe 请求前回调
func (s *cHook) BeforeServe(r *ghttp.Request) {
}

// AfterOutput 请求后回调
func (s *cHook) AfterOutput(r *ghttp.Request) {
}
