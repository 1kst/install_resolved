#!/bin/bash

# 更新包列表
apt update

# 安装 systemd（如果未安装）
apt install -y systemd

# 启用并启动 systemd-resolved 服务
systemctl enable systemd-resolved
systemctl start systemd-resolved

# 创建 /etc/resolv.conf 的符号链接
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# 修改 /etc/systemd/resolved.conf 文件
{
  echo "[Resolve]"
  echo "DNS=8.8.8.8 1.1.1.1"
  echo "Cache=yes"
} > /etc/systemd/resolved.conf

# 重启 systemd-resolved 服务以应用更改
systemctl restart systemd-resolved

echo "systemd-resolved 已成功安装并启用，配置已更新。"
