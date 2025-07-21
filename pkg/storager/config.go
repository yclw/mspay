// Package storager
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2023 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
package storager

// UploadConfig 上传配置
type UploadConfig struct {
	// 通用配置
	Drive     string `json:"uploadDrive"`
	FileSize  int64  `json:"uploadFileSize"`
	FileType  string `json:"uploadFileType"`
	ImageSize int64  `json:"uploadImageSize"`
	ImageType string `json:"uploadImageType"`
	// 本地存储配置
	LocalPath string `json:"uploadLocalPath"`
	// UCloud对象存储配置
	UCloudBucketHost string `json:"uploadUCloudBucketHost"`
	UCloudBucketName string `json:"uploadUCloudBucketName"`
	UCloudEndpoint   string `json:"uploadUCloudEndpoint"`
	UCloudFileHost   string `json:"uploadUCloudFileHost"`
	UCloudPath       string `json:"uploadUCloudPath"`
	UCloudPrivateKey string `json:"uploadUCloudPrivateKey"`
	UCloudPublicKey  string `json:"uploadUCloudPublicKey"`
	// 腾讯云cos配置
	CosSecretId  string `json:"uploadCosSecretId"`
	CosSecretKey string `json:"uploadCosSecretKey"`
	CosBucketURL string `json:"uploadCosBucketURL"`
	CosPath      string `json:"uploadCosPath"`
	// 阿里云oss配置
	OssSecretId  string `json:"uploadOssSecretId"`
	OssSecretKey string `json:"uploadOssSecretKey"`
	OssEndpoint  string `json:"uploadOssEndpoint"`
	OssBucketURL string `json:"uploadOssBucketURL"`
	OssPath      string `json:"uploadOssPath"`
	OssBucket    string `json:"uploadOssBucket"`
	// 七牛云对象存储配置
	QiNiuAccessKey string `json:"uploadQiNiuAccessKey"`
	QiNiuSecretKey string `json:"uploadQiNiuSecretKey"`
	QiNiuDomain    string `json:"uploadQiNiuDomain"`
	QiNiuPath      string `json:"uploadQiNiuPath"`
	QiNiuBucket    string `json:"uploadQiNiuBucket"`
	// minio配置
	MinioAccessKey string `json:"uploadMinioAccessKey"`
	MinioSecretKey string `json:"uploadMinioSecretKey"`
	MinioEndpoint  string `json:"uploadMinioEndpoint"`
	MinioUseSSL    int    `json:"uploadMinioUseSSL"`
	MinioPath      string `json:"uploadMinioPath"`
	MinioBucket    string `json:"uploadMinioBucket"`
	MinioDomain    string `json:"uploadMinioDomain"`
}

var config *UploadConfig

func SetConfig(c *UploadConfig) {
	config = c
}

func GetConfig() *UploadConfig {
	return config
}
