package sys

import (
	"context"

	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/internal/dao"
	"github.com/yclw/mspay/internal/model/entity"
	"github.com/yclw/mspay/internal/model/input/sysin"
	"github.com/yclw/mspay/pkg/dict"
	"github.com/yclw/mspay/pkg/orm"

	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
)

var SDictType = NewTDictType()

type sDictType struct{}

func NewTDictType() *sDictType {
	return &sDictType{}
}

// Tree 树
func (s *sDictType) Tree(ctx context.Context) (list []*sysin.DictTypeTree, err error) {
	var (
		mod    = dao.TDictType.Ctx(ctx)
		models []*entity.TDictType
	)

	if err = mod.Order("sort asc,id asc").Scan(&models); err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return
	}

	list = s.treeList(0, models)
	return
}

// Delete 删除
func (s *sDictType) Delete(ctx context.Context, in *sysin.DictTypeDeleteInp) (err error) {
	var models *entity.TDictType
	if err = dao.TDictType.Ctx(ctx).Where("id", in.Id).Scan(&models); err != nil {
		return
	}

	if models == nil {
		err = gerror.New("数据不存在或已删除！")
		return
	}

	exist, err := dao.TDictData.Ctx(ctx).Where("type", models.Type).One()
	if err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return err
	}
	if !exist.IsEmpty() {
		err = gerror.New("请先删除该字典类型下得所有字典数据！")
		return
	}

	pidExist, err := dao.TDictType.Ctx(ctx).Where("pid", models.Id).One()
	if err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return err
	}

	if !pidExist.IsEmpty() {
		err = gerror.New("请先删除该字典类型下得所有子级类型！")
		return
	}

	_, err = dao.TDictType.Ctx(ctx).Where("id", in.Id).Delete()
	return
}

// Edit 修改/新增
func (s *sDictType) Edit(ctx context.Context, in *sysin.DictTypeEditInp) (err error) {
	if err = orm.IsUnique(ctx, &dao.TDictType, g.Map{dao.TDictType.Columns().Name: in.Name}, "名称已存在", in.Id); err != nil {
		return
	}

	// 修改
	if in.Id > 0 {
		if _, err = dao.TDictType.Ctx(ctx).Fields(sysin.DictTypeUpdateFields{}).WherePri(in.Id).Data(in).Update(); err != nil {
			err = gerror.Wrap(err, consts.ErrorORM)
		}
		return
	}

	// 新增
	if _, err = dao.TDictType.Ctx(ctx).Fields(sysin.DictTypeInsertFields{}).Data(in).OmitEmptyData().Insert(); err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
	}
	return
}

// TreeSelect 获取类型关系树选项
func (s *sDictType) TreeSelect(ctx context.Context, in *sysin.DictTreeSelectInp) (list []*sysin.DictTypeTree, err error) {
	var (
		mod    = dao.TDictType.Ctx(ctx)
		models []*entity.TDictType
	)

	if err = mod.Order("pid asc,sort asc").Scan(&models); err != nil {
		err = gerror.Wrap(err, consts.ErrorORM)
		return
	}

	list = s.treeList(0, models)
	list = append(list, s.BuiltinSelect()...)
	return
}

// BuiltinSelect 内置字典选项
func (s *sDictType) BuiltinSelect() (list []*sysin.DictTypeTree) {
	top := &sysin.DictTypeTree{
		TDictType: entity.TDictType{
			Id:  dict.BuiltinId,
			Pid: 0,
		},
		Label: "内置字典",
		Value: dict.BuiltinId,
		Key:   dict.BuiltinId,
	}

	enums := &sysin.DictTypeTree{
		TDictType: entity.TDictType{
			Id:  dict.EnumsId,
			Pid: dict.BuiltinId,
		},
		Label: "枚举字典",
		Value: dict.EnumsId,
		Key:   dict.EnumsId,
	}

	for _, v := range dict.GetAllEnums() {
		children := &sysin.DictTypeTree{
			TDictType: entity.TDictType{
				Id:  v.Id,
				Pid: dict.EnumsId,
			},
			Label: v.Label,
			Value: v.Id,
			Key:   v.Id,
		}
		enums.Children = append(enums.Children, children)
	}

	fun := &sysin.DictTypeTree{
		TDictType: entity.TDictType{
			Id:  dict.FuncId,
			Pid: dict.BuiltinId,
		},
		Label: "方法字典",
		Value: dict.FuncId,
		Key:   dict.FuncId,
	}

	for _, v := range dict.GetAllFunc() {
		children := &sysin.DictTypeTree{
			TDictType: entity.TDictType{
				Id:  v.Id,
				Pid: dict.FuncId,
			},
			Label: v.Label,
			Value: v.Id,
			Key:   v.Id,
		}
		fun.Children = append(fun.Children, children)
	}

	top.Children = append(top.Children, enums, fun)
	list = append(list, top)
	return
}

// treeList 树状列表
func (s *sDictType) treeList(pid int64, nodes []*entity.TDictType) (list []*sysin.DictTypeTree) {
	list = make([]*sysin.DictTypeTree, 0)
	for _, v := range nodes {
		if v.Pid == pid {
			item := new(sysin.DictTypeTree)
			item.TDictType = *v
			item.Label = v.Name
			item.Value = v.Id
			item.Key = v.Id

			child := s.treeList(v.Id, nodes)
			if len(child) > 0 {
				item.Children = child
			}
			list = append(list, item)
		}
	}
	return
}
