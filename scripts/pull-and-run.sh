#!/usr/bin/env bash
set -euo pipefail
IMAGE="${DOCKERHUB_USER:-xiaoluya}/yaowei-cloud-suite:latest"
PORT="${PORT:-8899}"
ENDPOINT="${YAOWEI_LICENSE_ENDPOINT:-}"
docker pull "$IMAGE"
docker rm -f yaowei-cloud >/dev/null 2>&1 || true
docker run -d --name yaowei-cloud --restart unless-stopped -p "$PORT:80" -e "YAOWEI_LICENSE_ENDPOINT=$ENDPOINT" -e YAOWEI_LICENSE_SKU=yaowei-cloud-suite -e YAOWEI_LICENSE_OFFLINE_GRACE_DAYS=7 "$IMAGE"
echo "启动完成: http://localhost:$PORT"
