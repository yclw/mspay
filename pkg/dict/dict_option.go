// Package dict
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2023 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
package dict

import (
	"hash/fnv"

	"github.com/gogf/gf/v2/util/gconv"
)

// Option 字典数据选项
type Option struct {
	Key       interface{} `json:"key"`
	Label     string      `json:"label"     description:"字典标签"`
	Value     interface{} `json:"value"     description:"字典键值"`
	ValueType string      `json:"valueType" description:"键值数据类型"`
	Type      string      `json:"type"      description:"字典类型"`
	ListClass string      `json:"listClass" description:"表格回显样式"`
	Extra     interface{} `json:"extra"     description:"额外数据配置"`
}

// GenDefaultOption 生成默认表格回显样式
func GenDefaultOption(key interface{}, label string, extra ...any) *Option {
	e := interface{}(nil)
	if len(extra) > 0 {
		e = extra[0]
	}
	return &Option{
		Key:       key,
		Label:     label,
		Value:     key,
		ListClass: "default",
		Extra:     e,
	}
}

func GenSuccessOption(key interface{}, label string, extra ...any) *Option {
	e := interface{}(nil)
	if len(extra) > 0 {
		e = extra[0]
	}
	return &Option{
		Key:       key,
		Label:     label,
		Value:     key,
		ListClass: "success",
		Extra:     e,
	}
}

func GenWarningOption(key interface{}, label string, extra ...any) *Option {
	e := interface{}(nil)
	if len(extra) > 0 {
		e = extra[0]
	}
	return &Option{
		Key:       key,
		Label:     label,
		Value:     key,
		ListClass: "warning",
		Extra:     e,
	}
}

func GenErrorOption(key interface{}, label string, extra ...any) *Option {
	e := interface{}(nil)
	if len(extra) > 0 {
		e = extra[0]
	}
	return &Option{
		Key:       key,
		Label:     label,
		Value:     key,
		ListClass: "error",
		Extra:     e,
	}
}

func GenInfoOption(key interface{}, label string, extra ...any) *Option {
	e := interface{}(nil)
	if len(extra) > 0 {
		e = extra[0]
	}
	return &Option{
		Key:       key,
		Label:     label,
		Value:     key,
		ListClass: "info",
		Extra:     e,
	}
}

func GenPrimaryOption(key interface{}, label string, extra ...any) *Option {
	e := interface{}(nil)
	if len(extra) > 0 {
		e = extra[0]
	}
	return &Option{
		Key:       key,
		Label:     label,
		Value:     key,
		ListClass: "primary",
		Extra:     e,
	}
}

// GenCustomOption 生成自定义表格回显样式
func GenCustomOption(key interface{}, label string, custom string, extra ...any) *Option {
	e := interface{}(nil)
	if len(extra) > 0 {
		e = extra[0]
	}
	return &Option{
		Key:       key,
		Label:     label,
		Value:     key,
		ListClass: custom,
		Extra:     e,
	}
}

// GenHashOption 根据不同label以hash算法生成表格回显样式
func GenHashOption(key interface{}, label string, extra ...any) *Option {
	e := interface{}(nil)
	if len(extra) > 0 {
		e = extra[0]
	}
	strings := []string{"default", "primary", "info", "success", "warning", "error"}
	hash := fnv.New32()

	tag := "default"
	if _, err := hash.Write(gconv.Bytes(label)); err == nil {
		index := int(hash.Sum32()) % len(strings)
		if index < len(strings) {
			tag = strings[index]
		}
	}
	return &Option{
		Key:       key,
		Label:     label,
		Value:     key,
		ListClass: tag,
		Extra:     e,
	}
}

// GetOption 通过key找到label
func GetOption(ses []*Option, key interface{}) *Option {
	for _, v := range ses {
		if gconv.String(v.Key) == gconv.String(key) {
			return v
		}
	}
	return nil
}

// GetOptionLabel 通过key找到label
func GetOptionLabel(ses []*Option, key interface{}) string {
	for _, v := range ses {
		if gconv.String(v.Key) == gconv.String(key) {
			return v.Label
		}
	}
	return ``
}

// HasOptionKey 是否存在指定key
func HasOptionKey(ses []*Option, key interface{}) bool {
	for _, v := range ses {
		if gconv.String(v.Key) == gconv.String(key) {
			return true
		}
	}
	return false
}

// UniqueOption 去重选项
func UniqueOption(src []*Option) (dst []*Option) {
	temp := map[string]struct{}{}
	for _, item := range src {
		key := gconv.String(item.Key)
		if _, ok := temp[key]; !ok {
			temp[key] = struct{}{}
			dst = append(dst, item)
		}
	}
	return dst
}
