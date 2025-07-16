// Package validate_test
// @Link  https://github.com/bufanyun/github.com/yclw/mspay
// @Copyright  Copyright (c) 2023 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/github.com/yclw/mspay/blob/master/LICENSE
package validate_test

import (
	"github.com/gogf/gf/v2/test/gtest"
	"github.com/yclw/mspay/utility/validate"
	"testing"
)

func TestIsEmail(t *testing.T) {
	b := validate.IsEmail("QTT123456@163.com")
	gtest.Assert(true, b)
}
