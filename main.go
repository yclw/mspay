package main

import (
	"github.com/gogf/gf/v2/os/gctx"
	"github.com/yclw/mspay/internal/cmd"
)

func main() {
	var ctx = gctx.GetInitCtx()
	//global.Init(ctx)
	cmd.Main.Run(ctx)
}
