package middleware

import (
	"reflect"
	"strings"
	"sync"

	"github.com/yclw/mspay/pkg/response"
	"github.com/yclw/mspay/util/validate"

	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/gogf/gf/v2/util/gmeta"
	"github.com/gogf/gf/v2/util/gtag"
)

// PreFilter 请求输入预处理
// api使用gf规范路由并且XxxReq结构体实现了validate.Filter接口即可
func (s *cMiddleware) PreFilter(r *ghttp.Request) {
	router := GetRequestRoute(r)
	if router == nil {
		r.Middleware.Next()
		return
	}

	// 获取路由信息
	funcInfo := router.Handler.Info

	// 非规范路由不处理
	if funcInfo.Type.NumIn() != 2 {
		r.Middleware.Next()
		return
	}

	// 获取输入参数类型
	inputType := funcInfo.Type.In(1)

	// 创建输入参数对象
	var inputObject reflect.Value
	if inputType.Kind() == reflect.Ptr {
		inputObject = reflect.New(inputType.Elem())
	} else {
		inputObject = reflect.New(inputType.Elem()).Elem()
	}

	// 先验证基本校验规则
	if err := r.Parse(inputObject.Interface()); err != nil {
		resp := gerror.Code(err)
		response.JsonExit(r, resp.Code(), gerror.Current(err).Error(), resp.Detail())
		return
	}

	// 没有实现预处理
	if _, ok := inputObject.Interface().(validate.Filter); !ok {
		r.Middleware.Next()
		return
	}

	// 执行预处理
	if err := validate.PreFilter(r.Context(), inputObject.Interface()); err != nil {
		resp := gerror.Code(err)
		response.JsonExit(r, resp.Code(), gerror.Current(err).Error(), resp.Detail())
		return
	}

	// 过滤后的参数
	r.SetParamMap(gconv.Map(inputObject.Interface()))
	r.Middleware.Next()
}

////////

// HTTPRouter http路由
type HTTPRouter struct {
	ghttp.RouterItem
	Tags        string `json:"tags"         dc:"接口所属的标签，用于接口分类"`
	Summary     string `json:"summary"      dc:"接口/参数概要描述"`
	Description string `json:"description"  dc:"接口/参数详细描述"`
}

var (
	httpRoutes         map[string]*HTTPRouter
	routeMutex         sync.Mutex
	shortTypeMapForTag = map[string]string{
		gtag.SummaryShort:      gtag.Summary,
		gtag.SummaryShort2:     gtag.Summary,
		gtag.DescriptionShort:  gtag.Description,
		gtag.DescriptionShort2: gtag.Description,
	}
)

// GetRequestRoute 获取当前请求路由属性
func GetRequestRoute(r *ghttp.Request) *HTTPRouter {
	key := GenFilterRequestKey(r)
	routes := LoadHTTPRoutes(r)
	router, ok := routes[key]
	if !ok {
		return nil
	}
	return router
}

// GenFilterRequestKey 根据请求生成唯一key
func GenFilterRequestKey(r *ghttp.Request) string {
	return GenRouteKey(r.Method, r.Request.URL.Path)
}

// GenFilterRouteKey 根据路由生成唯一key
func GenFilterRouteKey(r *ghttp.Router) string {
	return GenRouteKey(r.Method, r.Uri)
}

// GenRouteKey 生成唯一key
func GenRouteKey(method, path string) string {
	return strings.ToUpper(method) + " " + path
}

func LoadHTTPRoutes(r *ghttp.Request) map[string]*HTTPRouter {
	if httpRoutes == nil {
		routeMutex.Lock()
		defer routeMutex.Unlock()

		if httpRoutes != nil {
			return httpRoutes
		}

		httpRoutes = make(map[string]*HTTPRouter, len(r.Server.GetRoutes()))
		for _, v := range r.Server.GetRoutes() {
			key := GenFilterRouteKey(v.Handler.Router)
			if _, ok := httpRoutes[key]; !ok {
				router := new(HTTPRouter)
				router.RouterItem = v
				httpRoutes[key] = setRouterMeta(router)
			}
		}
	}
	return httpRoutes
}

func setRouterMeta(router *HTTPRouter) *HTTPRouter {
	if !router.RouterItem.Handler.Info.IsStrictRoute {
		return router
	}

	var reflectValue = reflect.ValueOf(router.Handler.Info.Value.Interface())
	for reflectValue.Kind() == reflect.Ptr {
		reflectValue = reflectValue.Elem()
	}

	if reflectValue.Kind() != reflect.Func {
		return router
	}

	var reflectType = reflect.TypeOf(router.Handler.Info.Value.Interface())
	if reflectType.NumIn() != 2 || reflectType.NumOut() != 2 {
		return router
	}

	var inputObject reflect.Value
	if reflectType.In(1).Kind() == reflect.Ptr {
		inputObject = reflect.New(reflectType.In(1).Elem()).Elem()
	} else {
		inputObject = reflect.New(reflectType.In(1)).Elem()
	}

	inputMetaMap := fillMapWithShortTags(gmeta.Data(inputObject.Interface()))
	router.Tags = inputMetaMap["tags"]
	router.Summary = inputMetaMap[gtag.Summary]
	router.Description = inputMetaMap[gtag.Description]
	return router
}

func fillMapWithShortTags(m map[string]string) map[string]string {
	for k, v := range shortTypeMapForTag {
		if m[v] == "" && m[k] != "" {
			m[v] = m[k]
		}
	}
	return m
}
