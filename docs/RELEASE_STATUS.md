# 曜维云 V5.0.2 发布结果

## 本次修复
- 修复容器通过 IP 打开后主界面卡死：授权 UI 的 MutationObserver 改为 requestAnimationFrame 节流，并避免反复写相同 DOM；实时刷新从 1.8 秒降到 5 秒，弹窗/授权遮罩期间暂停实时刷新。
- 登录页信息全部可在「系统设置」配置：公司名称、登录页主标题、说明、版本标签、品牌英文小字、流程标签、底部标签。
- 关闭登录绕过：\u0060?demo=1\u0060 不再自动登录，移除「进入现场端」无需密码入口，登录页不再显示默认账号密码。
- 授权默认改为云端强制：所有公网/局域网生产部署都要求逐设备激活；局域网免授权默认关闭，只有显式设置 \u0060YAOWEI_LICENSE_ALLOW_LOCAL=1\u0060 才作为本机演示放行。
- 防止导出账套到 B 设备自动激活：导出的账套本来不含 \u0060yaowei-license-v1\u0060 token；现在 B 设备默认不会因局域网 IP 自动有效，导入/导出也要求当前设备已授权。
- 导出/导入增加授权门禁：未授权时调用 \u0060assertExport()\u0060 / \u0060assertImport()\u0060 会被拦截并弹出激活界面。
- 公开仓仍只含介绍、compose、部署脚本、文档和 version.json；核心源码、授权 Worker 源码、私钥、管理令牌均不公开。

## 镜像
- \u0060xiaoluya/yaowei-cloud-suite:latest\u0060
- \u0060xiaoluya/yaowei-cloud-suite:v5.0.2\u0060
- digest：\u0060sha256:c86f66b1d3dd6e969327dd69b30174842834d907f19142537c45e5ab2c7c6869\u0060

## 验证
- \u0060docker pull xiaoluya/yaowei-cloud-suite:latest\u0060 本地运行通过。
- \u0060/index.html\u0060 HTTP 200；\u0060/health\u0060 正常。
- 默认严格模式：\u0060?demo=1\u0060 不再进入系统；出现授权遮罩；\u0060assertExport()=false\u0060；无 JS 错误。
- \u0060YAOWEI_LICENSE_ALLOW_LOCAL=1\u0060 演示模式：可登录并进入设置页；登录页配置项、授权管理面板均存在。
- 公开仓 GitHub 树核验：核心源码/激活代码文件数为 0。
