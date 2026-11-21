# 部署说明

1. 拉取镜像：`docker pull xiaoluya/yaowei-cloud-suite:latest`
2. 启动容器：`docker compose up -d`
3. 浏览器访问：`http://设备IP:8899`
4. 飞牛安装可使用 Release 中的 FPK，向导可自定义端口，默认 8899
5. 业务数据自动保存在套件 `data/state.json`，升级或重装不要删除 data 目录
