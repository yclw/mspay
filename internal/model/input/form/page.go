package form

type ReqPageFunc interface {
	GetPage() int
	GetPerPage() int
}

// PageReq 分页请求
type PageReq struct {
	Page       int  `json:"page" example:"10" d:"1" v:"min:1#页码最小值不能低于1"  dc:"当前页码"`
	PerPage    int  `json:"pageSize" example:"1" d:"10" v:"min:1|max:200#每页数量最小值不能低于1|最大值不能大于200" dc:"每页数量"`
	Pagination bool `json:"pagination" d:"true" dc:"是否需要进行分页"`
}

// GetPage 获取当前页码
func (req *PageReq) GetPage() int {
	return req.Page
}

// GetPerPage 获取每页数量
func (req *PageReq) GetPerPage() int {
	return req.PerPage
}

// PageRes 分页响应
type PageRes struct {
	PageReq
	PageCount  int `json:"pageCount" example:"0"  dc:"分页个数"`
	TotalCount int `json:"totalCount" example:"0" dc:"数据总行数"`
}
