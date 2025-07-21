// Package sys
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2023 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
package sys

import (
	"context"

	"github.com/yclw/mspay/api/dict"
	"github.com/yclw/mspay/internal/service/sys"
)

var DictType = cDictType{}

var (
	DictTypeService = sys.SDictType
)

type cDictType struct{}

// Tree 树
func (c *cDictType) Tree(ctx context.Context, _ *dict.TypeTreeReq) (res *dict.TypeTreeRes, err error) {
	res = new(dict.TypeTreeRes)
	res.List, err = DictTypeService.Tree(ctx)
	return
}

// Delete 删除
func (c *cDictType) Delete(ctx context.Context, req *dict.TypeDeleteReq) (res *dict.TypeDeleteRes, err error) {
	err = DictTypeService.Delete(ctx, &req.DictTypeDeleteInp)
	return
}

// Edit 更新
func (c *cDictType) Edit(ctx context.Context, req *dict.TypeEditReq) (res *dict.TypeEditRes, err error) {
	err = DictTypeService.Edit(ctx, &req.DictTypeEditInp)
	return
}
