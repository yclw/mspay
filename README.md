# 
初始化框架中 ~~~~

## 目标
一个api key管理系统，类似chatgpt/deepseek的api key管理工具

将会以一个模拟的四方支付平台为暂时的目标开发

### 架构
```
Controller层 -> Service层(接口) -> Dao层
     ↓             ↓               ↓
  请求处理     业务逻辑实现         数据访问
```
Controller调用Service层，Service层调用Dao层，杜绝跨层调用，会尽可能保证避免同层调用

### 
[HotGo](https://github.com/bufanyun/hotgo) 框架二次开发