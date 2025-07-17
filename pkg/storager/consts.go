package storager

// cache
const (
	CacheToken           = "token"            // 登录token
	CacheTokenBind       = "token_bind"       // 登录用户身份绑定
	CacheMultipartUpload = "multipart_upload" // 分片上传
)

// 上传存储驱动
const (
	UploadDriveLocal  = "local"  // 本地驱动
	UploadDriveUCloud = "ucloud" // ucloud对象存储
	UploadDriveCos    = "cos"    // 腾讯云cos
	UploadDriveOss    = "oss"    // 阿里云oss
	UploadDriveQiNiu  = "qiniu"  // 七牛云对象存储
	UploadDriveMinio  = "minio"  // minio对象存储
)
