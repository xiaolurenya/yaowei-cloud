# 曜维云 V5.0.3 发布结果（最终版）

## 已完成
- 业务数据不再只存浏览器 localStorage：镜像内置 Node 静态服务器与 \u0060/api/state\u0060， \u0060state-sync.js\u0060 通过代理 \u0060Storage.prototype.setItem\u0060 捕获所有 \u0060wc-suite-v4\u0060 保存动作，自动同步到 \u0060/app/data/state.json\u0060。
- Docker / 飞牛 FPK 增加持久卷 \u0060/app/data\u0060；升级、重装容器后业务数据仍可恢复。
- 授权平台自定义域名已绑定并验证：
  - \u0060https://ywyt.xlry.cc.cd/\u0060 返回授权管理页
  - \u0060https://ywyt.xlry.cc.cd/admin\u0060 返回授权管理页
  - \u0060https://ywyt.xlry.cc.cd/health\u0060 返回 \u0060{"ok":true,"service":"YaoWei License Hub"}\u0060
- 保留 v5.0.2：登录页信息可配置、关闭 \u0060?demo=1\u0060 与「进入现场端」绕过、云端强制授权、导出/导入授权门禁。
- 导出的账套不含 \u0060yaowei-license-v1\u0060 授权 token；B 设备导入后不会自动激活授权。

## 镜像
- \u0060xiaoluya/yaowei-cloud-suite:latest\u0060
- \u0060xiaoluya/yaowei-cloud-suite:v5.0.3\u0060
- digest：\u0060sha256:937ed29578cbc76fcc6a7e4cc95f02443cd061501e1a4c98998fffb782e1c570\u0060

## 验证
- \u0060/health\u0060 正常；
- \u0060/index.html\u0060 HTTP 200，资源版本 \u0060state-sync.js?v=2 / license.js?v=4 / app.js?v=36\u0060；
- \u0060/license-config.js\u0060 注入 \u0060https://ywyt.xlry.cc.cd\u0060；
- 浏览器中 \u0060localStorage.setItem('wc-suite-v4', ...)\u0060 后，\u0060/api/state\u0060 自动读到同样数据；
- \u0060POST /api/state\u0060 写入挂载卷 \u0060state.json\u0060；容器重建后 \u0060GET /api/state\u0060 仍读到原业务数据；
- 公开仓不上传核心源码、Worker 源码、私钥、管理令牌。
