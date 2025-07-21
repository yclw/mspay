package sys

import (
	"context"
	"errors"

	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/internal/dao"
	"github.com/yclw/mspay/internal/model/input/sysin"
	"github.com/yclw/mspay/pkg/dict"

	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
)

var SDictData = NewTDictData()

type sDictData struct{}

func NewTDictData() *sDictData {
	return &sDictData{}
}

// Delete 删除
func (s *sDictData) Delete(ctx context.Context, in *sysin.DictDataDeleteInp) error {
	_, err := dao.TDictData.Ctx(ctx).Where("id", in.Id).Delete()
	if err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return err
	}
	return nil
}

// Edit 修改/新增
func (s *sDictData) Edit(ctx context.Context, in *sysin.DictDataEditInp) (err error) {
	// 修改
	if in.Id > 0 {
		_, err = dao.TDictData.Ctx(ctx).Fields(sysin.DictDataUpdateFields{}).WherePri(in.Id).Data(in).Update()
		if err != nil {
			err = gerror.Wrap(err, consts.ErrorORM)
			return err
		}
		return nil
	}

	// 新增
	in.Type, err = s.GetType(ctx, in.TypeID)
	if err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return err
	}

	if in.Type == "" {
		return gerror.Wrap(err, "类型选择无效，请检查")
	}

	_, err = dao.TDictData.Ctx(ctx).Fields(sysin.DictDataInsertFields{}).Data(in).OmitEmptyData().Insert()
	if err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return err
	}
	return nil
}

// List 获取列表
func (s *sDictData) List(ctx context.Context, in *sysin.DictDataListInp) (list []*sysin.DictDataListModel, totalCount int, err error) {
	mod := dao.TDictData.Ctx(ctx)
	// 类型ID
	if in.TypeID > 0 {
		types, err := s.GetTypes(ctx, in.TypeID)
		if err != nil {
			return list, totalCount, err
		}
		mod = mod.WhereIn("type", types)
	}

	if in.Type != "" {
		mod = mod.Where("type", in.Type)
	}

	if in.Value != "" {
		mod = mod.Where("value", in.Value)
	}

	if in.Label != "" {
		mod = mod.WhereLike("label", "%"+in.Label+"%")
	}

	if in.Status > 0 {
		mod = mod.Where("status", in.Status)
	}

	totalCount, err = mod.Count()
	if err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return list, totalCount, err
	}

	if totalCount == 0 {
		return list, totalCount, nil
	}

	if err = mod.Page(in.Page, in.PerPage).Order("sort asc,id desc").Scan(&list); err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return list, totalCount, err
	}

	for _, v := range list {
		v.TypeID, _ = s.GetId(ctx, v.Type)
	}
	return list, totalCount, err
}

// GetId 获取指定类型的ID
func (s *sDictData) GetId(ctx context.Context, t string) (id int64, err error) {
	m := dao.TDictType.Ctx(ctx).Fields(dao.TDictType.Columns().Id).Where(dao.TDictType.Columns().Type, t).Where(dao.TDictType.Columns().Status, consts.StatusEnabled)
	val, err := m.Value()
	if err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return 0, err
	}
	return val.Int64(), nil
}

// GetType 获取指定ID的类型标识
func (s *sDictData) GetType(ctx context.Context, id int64) (types string, err error) {
	m := dao.TDictType.Ctx(ctx).Fields(dao.TDictType.Columns().Type).Where(dao.TDictType.Columns().Id, id).Where(dao.TDictType.Columns().Status, consts.StatusEnabled)
	val, err := m.Value()
	if err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return types, err
	}
	return val.String(), nil
}

// GetTypes 获取指定ID的所有类型标识，包含下级
func (s *sDictData) GetTypes(ctx context.Context, id int64) (types []string, err error) {
	columns, err := dao.TDictType.Ctx(ctx).Fields(dao.TDictType.Columns().Type).
		Where(dao.TDictType.Columns().Id, id).WhereOr(dao.TDictType.Columns().Pid, id).Where(dao.TDictType.Columns().Status, consts.StatusEnabled).
		Array()
	types = g.NewVar(columns).Strings()
	return
}

// Select 获取列表
func (s *sDictData) Select(ctx context.Context, in *sysin.DataSelectInp) (list sysin.DataSelectModel, err error) {
	// 优先从内置字典中获取
	options, err := dict.GetOptions(ctx, in.Type)
	if err == nil {
		return options, nil
	}
	if !errors.Is(err, dict.ErrNotExistKey) {
		return nil, err
	}

	mod := dao.TDictData.Ctx(ctx).Where("type", in.Type)
	if err = mod.Order("sort asc,id desc").Scan(&list); err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return
	}

	for k, v := range list {
		list[k].Value = consts.ConvType(v.Value, v.ValueType)
		list[k].Key = list[k].Value
	}

	if len(list) == 0 {
		list = make(sysin.DataSelectModel, 0)
	}
	return
}
