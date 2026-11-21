# 曜维云 · YaoWei Cloud

> 把报价、合同、成本、库存、回款、现场工单和经营驾驶舱，装进一个弱电工程经营平台。

本仓库是**公开介绍仓库**：项目说明、Docker Hub 镜像拉取、NAS 部署文档、授权连接说明。核心源码位于私有仓库 `yaowei-cloud-core`。

## 镜像
```text
xiaoluya/yaowei-cloud-suite:latest
```

固定版本：
```text
xiaoluya/yaowei-cloud-suite:v5.0.0
```

当前 digest：`sha256:398aabc2ef7106c0101773c971d0d4cc1c9c560df17afad8cf78abe3010f9854`
```
```

## 一键启动
```bash
chmod +x scripts/pull-and-run.sh
./scripts/pull-and-run.sh
```

或：
```bash
docker compose up -d
```

访问：`http://localhost:8899` 或 `http://NAS的IP:8899`。

## 授权平台
- Cloudflare Worker：`yaowei-license-hub`
- 地址：<https://yaowei-license-hub.435675554-57b.workers.dev>
- 公网部署由 `YAOWEI_LICENSE_ENDPOINT` 注入；局域网默认离线可用。

## 客户端授权
局域网 / 127.0.0.1 / 192.168.x.x 默认离线可用。公网部署设置：
```bash
YAOWEI_LICENSE_ENDPOINT=https://yaowei-license-hub.435675554-57b.workers.dev
```
首次进入「授权管理」输入授权码。


## 飞牛 NAS 安装包

- 版本：v5.0.2
- 文件：`YaoWeiCloud-5.0.2-Feiniu.fpk`
- 镜像 digest：`sha256:c86f66b1d3dd6e969327dd69b30174842834d907f19142537c45e5ab2c7c6869`
- SHA256：`7879d2c53724480531bb696113f6de69d01bd574f5bc6244622214631bc188fa`
- 下载：[GitHub Releases / v5.0.2](https://github.com/xiaolurenya/yaowei-cloud/releases/tag/v5.0.2)

安装后访问 `http://设备IP:8899`。生产默认强制云端授权；仅内网演示可在 compose 中设置 `YAOWEI_LICENSE_ALLOW_LOCAL=1`。

## 功能
- 经营驾驶舱 / 实时大屏
- 报价配置清单、成本价、毛利、含税/不含税
- 合同范本库、逐行预览/打印
- 回款凭证、财务台账
- 采购入库、领料出库、移动加权成本
- 真实成本利润核算
- 导出中心：CSV / Excel / Word / JSON 账套
- 消息中心勾选删除
- 业务场景开关
- 授权系统

## 仓库划分
| 仓库 | 可见性 | 内容 |
|---|---|---|
| yaowei-cloud | 公开 | 项目介绍、镜像拉取、部署脚本 |
| yaowei-cloud-core | 私有 | 核心源码、Dockerfile、授权 Worker、CI |