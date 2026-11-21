# 曜维云 V5.0 产品化 / 授权 / 发布结果（已完成）

## 一、品牌与仓库
- 产品：曜维云 · 弱电工程经营平台
- 公司：曜维云科技有限公司
- 私有核心源码仓：<https://github.com/xiaolurenya/yaowei-cloud-core>
- 公开介绍 / 镜像拉取仓：<https://github.com/xiaolurenya/yaowei-cloud>
- Docker 镜像：`xiaoluya/yaowei-cloud-suite`
- 授权平台：`YaoWei License Hub`

## 二、授权系统
前端已集成：
- `license-config.js`：容器启动时由 `deploy/docker/entrypoint.sh` 动态注入授权平台地址；
- `license.js`：局域网离线授权、云端激活、授权校验、设备解绑、7 天离线宽限、MutationObserver 自动挂载授权入口；
- `license.css`：授权弹窗、设置页授权管理面板、顶栏「授」状态按钮；
- 局域网 / localhost / 127.0.0.1 / 192.168.x.x 默认离线可用；
- 公网部署通过 `YAOWEI_LICENSE_ENDPOINT` 指向 Cloudflare License Hub；
- 授权状态与 token 保存在浏览器 localStorage。

## 三、Cloudflare 授权平台
- Worker：`yaowei-license-hub`
- KV namespace：`yaowei-license-hub`（ID：`5e9cd7637bae4250ac5921dbcab4a04f`）
- 部署地址：<https://yaowei-license-hub.435675554-57b.workers.dev>
- 接口：`/health`、`/activate`、`/verify`、`/deactivate`、`/admin/issue`、`/admin/revoke`、`/admin/list`
- 管理员发码脚本：`deploy/scripts/issue-license.sh`
- 本执行环境对 workers.dev 公网访问超时；Cloudflare KV namespace 与本地 deploy-result 记录存在，实际公网健康检查建议在外网机器复核。

## 四、Docker Hub 发布（已完成）
- 镜像：`xiaoluya/yaowei-cloud-suite:latest`
- 版本 tag：`xiaoluya/yaowei-cloud-suite:v5.0.0`
- digest：`sha256:398aabc2ef7106c0101773c971d0d4cc1c9c560df17afad8cf78abe3010f9854`
- 本地构建图像 ID：`7dfe1f2c9388`
- 本地容器验证：
  - `/health` 返回 `{"ok":true,"service":"yaowei-cloud-suite"}`
  - `/index.html` 加载 `license.css` / `license-config.js` / `license.js` / `app.js`
  - 容器启动时 `license-config.js` 正确注入 `YAOWEI_LICENSE_ENDPOINT`

## 五、GitHub 发布
- 公开仓 `yaowei-cloud`：README、docker-compose、部署文档、拉取脚本、发布状态、version.json、校验 workflow
- 私有源码仓 `yaowei-cloud-core`：静态 SPA 源码、Dockerfile、nginx 配置、CF Worker、授权前端、发码脚本、CI、测试与截图
- 通过 GitHub REST Contents API 定向推送；不输出任何 token 或密钥

## 六、回归验证
- `node --check app.js` 通过
- `node --check license.js` 通过
- `node --check app/app.js` 通过
- `node --check app/license.js` 通过
- `node --check deploy/license-worker/src.js` 通过
- Docker 构建通过
- 本地容器 `/health` 与授权配置注入通过
- Docker Hub `latest` / `v5.0.0` 推送成功

## 七、部署命令
```bash
docker pull xiaoluya/yaowei-cloud-suite:latest
docker compose up -d
```

或固定 digest：
```text
xiaoluya/yaowei-cloud-suite@sha256:398aabc2ef7106c0101773c971d0d4cc1c9c560df17afad8cf78abe3010f9854
```

访问：`http://NAS的IP:8899`。公网部署如需云端授权，保留 compose 中的 `YAOWEI_LICENSE_ENDPOINT`。
