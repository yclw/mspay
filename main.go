package main

import (
	"fmt"
	"github.com/gogf/gf/v2/os/gctx"
)

func main() {
	var _ = gctx.GetInitCtx()
	fmt.Println("init")
}
