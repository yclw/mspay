package middleware

import (
	"github.com/yclw/mspay/internal/consts"
	"github.com/yclw/mspay/pkg/response"
	"github.com/yclw/mspay/util/charset"
	"github.com/yclw/mspay/util/simple"

	"github.com/gogf/gf/v2/errors/gcode"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/util/gmeta"
)

// ResponseHandler HTTP响应预处理
func (s *cMiddleware) ResponseHandler(r *ghttp.Request) {
	r.Middleware.Next()

	// 错误状态码接管
	switch r.Response.Status {
	case 403:
		r.Response.Writeln("403 - 网站拒绝显示此网页")
		return
	case 404:
		r.Response.Writeln("404 - 你似乎来到了没有知识存在的荒原…")
		return
	}

	contentType := getContentType(r)
	// 已存在响应
	if contentType != consts.HTTPContentTypeStream && r.Response.BufferLength() > 0 { // && contexts.Get(r.Context()).Response != nil
		return
	}

	switch contentType {
	case consts.HTTPContentTypeHtml:
		responseHtml(r)
		return
	case consts.HTTPContentTypeXml:
		responseXml(r)
		return
	case consts.HTTPContentTypeStream:
	default:
		responseJson(r)
	}
}

// responseHtml html模板响应
func responseHtml(r *ghttp.Request) {
	code, message, resp := parseResponse(r)
	if code == gcode.CodeOK.Code() {
		return
	}

	r.Response.ClearBuffer()
	_ = r.Response.WriteTplContent(simple.DefaultErrorTplContent(r.Context()), g.Map{"code": code, "message": message, "stack": resp})
}

// responseXml xml响应
func responseXml(r *ghttp.Request) {
	code, message, data := parseResponse(r)
	response.RXml(r, code, message, data)
}

// responseJson json响应
func responseJson(r *ghttp.Request) {
	code, message, data := parseResponse(r)
	response.RJson(r, code, message, data)
}

// parseResponse 解析响应数据
func parseResponse(r *ghttp.Request) (code int, message string, resp interface{}) {
	ctx := r.Context()
	err := r.GetError()
	if err == nil {
		return gcode.CodeOK.Code(), "操作成功", r.GetHandlerResponse()
	}

	// 是否输出错误堆栈到页面
	if simple.Debug(ctx) {
		message = gerror.Current(err).Error()
		if getContentType(r) == consts.HTTPContentTypeHtml {
			resp = charset.SerializeStack(err) // 序列化错误堆栈
		} else {
			resp = charset.ParseErrStack(err) // 解析错误堆栈
		}
	} else {
		message = consts.ErrorMessage(gerror.Current(err))
	}

	code = gerror.Code(err).Code()

	// 记录异常日志
	// 如果你想对错误做不同的处理，可以通过定义不同的错误码来区分
	// 默认-1为安全可控错误码只记录文件日志，非-1为不可控错误，记录文件日志+服务日志并打印堆栈
	if code == gcode.CodeNil.Code() {
		g.Log().Stdout(false).Infof(ctx, "exception:%v", err)
	} else {
		g.Log().Errorf(ctx, "exception:%v", err)
	}
	return
}

func getContentType(r *ghttp.Request) (contentType string) {
	contentType = r.Response.Header().Get("Content-Type")
	if contentType != "" {
		return
	}

	mime := gmeta.Get(r.GetHandlerResponse(), "mime").String()
	if mime == "" {
		contentType = consts.HTTPContentTypeJson
	} else {
		contentType = mime
	}
	return
}
