# 曜维云 V5.0.13 发布结果

- 云端授权后台：记录表、设备解绑、吊销并清设备、授权码吊销。
- 每个客户/用户可生成独立 SKU；token 内 SKU 与后台记录绑定校验。
- 篡改 token 内 SKU 会因 HMAC 签名失败被拒绝。
- 未激活/试用/吊销状态只显示默认 SKU `yaowei-cloud-suite`；激活成功后才显示客户独立 SKU。
- 授权弹窗醒目显示「已激活」「已吊销」「试用版」状态。
- 保留 NAS 服务端授权备份 `/app/data/license-state.json`，刷新/清浏览器授权缓存后可恢复。
- 镜像 digest：`sha256:f8ac4ab9f512e50faefd561e307a442720d4643d74e29928b40a8477041de06a`。
