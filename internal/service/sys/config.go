package sys

import (
	"context"

	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/internal/dao"
	"github.com/yclw/mspay/internal/model/entity"
	"github.com/yclw/mspay/internal/model/input/sysin"
	"github.com/yclw/mspay/pkg/storager"
	"github.com/yclw/mspay/pkg/token"
	"github.com/yclw/mspay/util/simple"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/gogf/gf/v2/util/gconv"
)

var SSysConfig = NewSysConfig()

type sSysConfig struct{}

func NewSysConfig() *sSysConfig {
	return &sSysConfig{}
}

// GetLogin 获取登录配置
func (s *sSysConfig) GetLogin(ctx context.Context) (conf *sysin.LoginConfig, err error) {
	models, err := s.GetConfigByGroup(ctx, &sysin.GetConfigInp{Group: "login"})
	if err != nil {
		return
	}
	err = gconv.Scan(models.List, &conf)
	return
}

// GetUpload 获取上传配置
func (s *sSysConfig) GetUpload(ctx context.Context) (conf *storager.UploadConfig, err error) {
	models, err := s.GetConfigByGroup(ctx, &sysin.GetConfigInp{Group: "upload"})
	if err != nil {
		return
	}
	err = gconv.Scan(models.List, &conf)
	return
}

// GetBasic 获取基础配置
func (s *sSysConfig) GetBasic(ctx context.Context) (conf *sysin.BasicConfig, err error) {
	models, err := s.GetConfigByGroup(ctx, &sysin.GetConfigInp{Group: "basic"})
	if err != nil {
		return
	}
	err = gconv.Scan(models.List, &conf)
	return
}

// GetLoadToken 获取本地token配置
func (s *sSysConfig) GetLoadToken(ctx context.Context) (conf *token.TokenConfig, err error) {
	err = g.Cfg().MustGet(ctx, "token").Scan(&conf)
	return
}

// GetLoadLog 获取本地日志配置
func (s *sSysConfig) GetLoadLog(ctx context.Context) (conf *sysin.LogConfig, err error) {
	err = g.Cfg().MustGet(ctx, "system.log").Scan(&conf)
	return
}

// GetLoadServeLog 获取本地服务日志配置
func (s *sSysConfig) GetLoadServeLog(ctx context.Context) (conf *sysin.ServeLogConfig, err error) {
	err = g.Cfg().MustGet(ctx, "system.serveLog").Scan(&conf)
	return
}

// GetConfigByGroup 获取指定分组的配置
func (s *sSysConfig) GetConfigByGroup(ctx context.Context, in *sysin.GetConfigInp) (res *sysin.GetConfigModel, err error) {
	if in.Group == "" {
		err = gerror.New("分组不能为空")
		return
	}

	var models []*entity.SysConfig
	cols := dao.SysConfig.Columns()
	if err = dao.SysConfig.Ctx(ctx).Fields(cols.Key, cols.Value, cols.Type).Where(cols.Group, in.Group).Scan(&models); err != nil {
		err = gerror.Wrapf(err, "获取配置分组[ %v ]失败，请稍后重试！", in.Group)
		return
	}

	res = new(sysin.GetConfigModel)
	if len(models) > 0 {
		res.List = make(g.Map, len(models))
		for _, v := range models {
			val, err := s.ConversionType(ctx, v)
			if err != nil {
				return nil, err
			}
			res.List[v.Key] = val
		}
	}

	res.List = simple.FilterMaskDemo(ctx, res.List)
	return
}

// ConversionType 转换类型
func (s *sSysConfig) ConversionType(ctx context.Context, models *entity.SysConfig) (value interface{}, err error) {
	if models == nil {
		err = gerror.New("数据不存在")
		return
	}
	return consts.ConvType(models.Value, models.Type), nil
}

// UpdateConfigByGroup 更新指定分组的配置
func (s *sSysConfig) UpdateConfigByGroup(ctx context.Context, in *sysin.UpdateConfigInp) (err error) {
	if in.Group == "" {
		err = gerror.New("分组不能为空")
		return
	}
	var (
		mod    = dao.SysConfig.Ctx(ctx)
		models []*entity.SysConfig
	)

	if err = mod.Where("group", in.Group).Scan(&models); err != nil {
		return
	}

	err = dao.SysConfig.Transaction(ctx, func(ctx context.Context, tx gdb.TX) (err error) {
		for k, v := range in.List {
			row := s.getConfigByKey(k, models)
			// 新增
			if row == nil {
				err = gerror.Newf("暂不支持从前台添加变量，请先在数据库表[%v]中配置变量：%v", dao.SysConfig.Table(), k)
				return
			}

			// 更新
			_, err = dao.SysConfig.Ctx(ctx).Where("id", row.Id).Data(g.Map{"value": v, "updated_at": gtime.Now()}).Update()
			if err != nil {
				return
			}
		}
		return s.syncUpdate(ctx, in)
	})

	if err != nil {
		return
	}

	// global.PublishClusterSync(ctx, consts.ClusterSyncSysconfig, nil)
	return
}

func (s *sSysConfig) getConfigByKey(key string, models []*entity.SysConfig) *entity.SysConfig {
	if len(models) == 0 {
		return nil
	}

	for _, v := range models {
		if key == v.Key {
			return v
		}
	}
	return nil
}

// syncUpdate 同步更新一些加载配置
func (s *sSysConfig) syncUpdate(ctx context.Context, in *sysin.UpdateConfigInp) (err error) {
	// var cfg any
	// switch in.Group {
	// case "wechat":
	// 	cfg, err = s.GetWechat(ctx)
	// 	if err == nil {
	// 		wechat.SetConfig(cfg.(*sysin.WechatConfig))
	// 	}
	// case "pay":
	// 	cfg, err = s.GetPay(ctx)
	// 	if err == nil {
	// 		payment.SetConfig(cfg.(*sysin.PayConfig))
	// 	}
	// case "upload":
	// 	cfg, err = s.GetUpload(ctx)
	// 	if err == nil {
	// 		storager.SetConfig(cfg.(*sysin.UploadConfig))
	// 	}
	// case "sms":
	// 	cfg, err = s.GetSms(ctx)
	// 	if err == nil {
	// 		sms.SetConfig(cfg.(*sysin.SmsConfig))
	// 	}
	// }

	if err != nil {
		err = gerror.Newf("syncUpdate %v conifg fail：%+v", in.Group, err.Error())
	}
	return
}
