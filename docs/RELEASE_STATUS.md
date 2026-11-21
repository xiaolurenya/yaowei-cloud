# 曜维云 V5.0.3 发布结果

## 已完成
- 业务数据不再只存浏览器 localStorage：镜像内置 Node 静态服务器与 \u0060/api/state\u0060，自动把 \u0060wc-suite-v4\u0060 账套保存到 \u0060/app/data/state.json\u0060。
- Docker / 飞牛 FPK 增加持久卷 \u0060/app/data\u0060；升级、重装容器后业务数据仍可恢复。
- 授权平台地址统一切换为 \u0060https://ywyt.xlry.cc.cd/\u0060。
- 保留 v5.0.2：登录页信息可配置、关闭 \u0060?demo=1\u0060 与「进入现场端」绕过、云端强制授权、导出/导入授权门禁。
- 导出的账套不含 \u0060yaowei-license-v1\u0060 授权 token；B 设备导入后不会自动激活授权。

## 镜像
- \u0060xiaoluya/yaowei-cloud-suite:latest\u0060
- \u0060xiaoluya/yaowei-cloud-suite:v5.0.3\u0060
- digest：\u0060sha256:1558eb7523192e5041bc6b8458e4a9a39ab1c0d01e1516f3626bbdb7bd803235\u0060

## 验证
- \u0060/health\u0060 正常；
- \u0060/index.html\u0060 HTTP 200；
- \u0060/license-config.js\u0060 注入 \u0060https://ywyt.xlry.cc.cd\u0060；
- \u0060POST /api/state\u0060 写入挂载卷 \u0060state.json\u0060；
- 容器重建后 \u0060GET /api/state\u0060 仍读到原业务数据。

## Cloudflare 域名
- 软件配置已使用 \u0060https://ywyt.xlry.cc.cd/\u0060。
- 当前会话中的 Cloudflare API token 对 \u0060workers/domains\u0060 返回 405，对 zone worker routes 返回 403；若域名尚未解析到 Worker，需要具有 Workers Routes / Custom Domains 权限的 token，或在 Cloudflare 后台手动把 \u0060ywyt.xlry.cc.cd/*\u0060 绑定到 \u0060yaowei-license-hub\u0060。
