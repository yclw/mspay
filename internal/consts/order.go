package consts

// 订单分组
// 为不同的业务订单设置不同的分组，分组可以设置不同的业务回调方法

const (
	OrderGroupDefault    = "order"       // 普通订单
	OrderGroupAdminOrder = "admin_order" // 后台充值订单
	// 还可以设置其他，方便后期扩展..
)

// 订单类型

const (
	OrderTypeBalance = "balance" // 余额充值
	OrderTypeProduct = "product" // 购买产品
)

const (
	OrderStatusALL           = -1 // 全部状态
	OrderStatusNotPay        = 1  // 待付款
	OrderStatusPay           = 2  // 已付款
	OrderStatusShipments     = 3  // 已发货
	OrderStatusDone          = 4  // 已完成
	OrderStatusClose         = 5  // 已关闭
	OrderStatusReturnRequest = 6  // 申请退款
	OrderStatusReturning     = 7  // 退款中
	OrderStatusReturned      = 8  // 已退款
	OrderStatusReturnReject  = 9  // 拒绝退款
)
