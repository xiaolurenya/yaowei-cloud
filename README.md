# 曜维云 · YaoWei Cloud

> 把报价、合同、成本、库存、回款、现场工单和经营驾驶舱，装进一个弱电工程经营平台。

本仓库是**公开介绍仓库**：提供项目说明、Docker Hub 镜像拉取、NAS 部署文档和飞牛安装包下载。核心源码位于私有仓库 `yaowei-cloud-core`。

## 镜像

```text
xiaoluya/yaowei-cloud-suite:latest
```

固定版本：

```text
xiaoluya/yaowei-cloud-suite:v5.0.5
```

当前 digest：`sha256:a044f4eef9f1ba91f452e1fb810a50953c55b79f9161e38125a41d978cc90d94`

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

## 飞牛 NAS 安装包

业务数据保存到 `YaoWeiCloud/data/state.json`，升级/重装容器不会删除；不要执行 `docker compose down -v`。

- 版本：v5.0.5
- 文件：`YaoWeiCloud-5.0.5-Feiniu.fpk`
- 镜像 digest：`sha256:a044f4eef9f1ba91f452e1fb810a50953c55b79f9161e38125a41d978cc90d94`
- 下载：[GitHub Releases / v5.0.5](https://github.com/xiaolurenya/yaowei-cloud/releases/tag/v5.0.5)

安装后访问 `http://设备IP:8899`。安装向导可自定义访问端口，默认 8899。

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
| yaowei-cloud | 公开 | 项目介绍、镜像拉取、部署脚本、飞牛包下载 |
| yaowei-cloud-core | 私有 | 核心源码、Dockerfile、授权 Worker、CI |
