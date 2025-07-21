// Package sys
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2023 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
package sys

import (
	"context"

	"github.com/yclw/mspay/api/dict"
	"github.com/yclw/mspay/internal/model/input/sysin"
	"github.com/yclw/mspay/internal/service/sys"
)

var DictData = cDictData{}

var (
	DictDataService = sys.SDictData
)

type cDictData struct{}

// Delete 删除
func (c *cDictData) Delete(ctx context.Context, req *dict.DataDeleteReq) (res *dict.DataDeleteRes, err error) {
	err = DictDataService.Delete(ctx, &req.DictDataDeleteInp)
	return
}

// Edit 更新
func (c *cDictData) Edit(ctx context.Context, req *dict.DataEditReq) (res *dict.DataEditRes, err error) {
	err = DictDataService.Edit(ctx, &req.DictDataEditInp)
	return
}

// List 查看列表
func (c *cDictData) List(ctx context.Context, req *dict.DataListReq) (res *dict.DataListRes, err error) {
	list, totalCount, err := DictDataService.List(ctx, &req.DictDataListInp)
	if err != nil {
		return
	}

	res = new(dict.DataListRes)
	res.List = list
	res.PageRes.Pack(req, totalCount)
	return
}

// Select 指定选项
func (c *cDictData) Select(ctx context.Context, req *dict.DataSelectReq) (res dict.DataSelectRes, err error) {
	list, err := DictDataService.Select(ctx, &req.DataSelectInp)
	if err != nil {
		return
	}

	res = dict.DataSelectRes(list)
	return
}

// Selects 多个选项
func (c *cDictData) Selects(ctx context.Context, req *dict.DataSelectsReq) (res dict.DataSelectsRes, err error) {
	res = make(dict.DataSelectsRes)
	for _, v := range req.Types {
		option, err := DictDataService.Select(ctx, &sysin.DataSelectInp{Type: v})
		if err != nil {
			return nil, err
		}
		res[v] = option
	}
	return
}
