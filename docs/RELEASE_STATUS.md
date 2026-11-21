# 曜维云 V5.0.4 发布结果

- 授权平台地址更正为 `https://ywy.xlry.cc.cd/`，旧 `ywyt.xlry.cc.cd` 已解绑。
- 授权管理 `/` 与 `/admin` 已增加管理密码保护；管理密码不写入镜像、公开仓或 FPK。
- 后台可编辑价格、微信、QQ、电话、邮箱、店铺、二维码和说明；用户前台授权弹窗打开时读取 `/public/config`，并每 30 秒刷新。
- FPK 安装向导去掉授权模式选择，改为「访问端口」输入框，默认 8899，用户可手动修改。
- 业务数据仍保存到 NAS 持久卷 `/app/data/state.json`。
- 镜像 digest：`sha256:b5b63256b274ad1c4f8e9734f37bf53cb2633919c2d2867cb055be6fcdbf9ab5`。
