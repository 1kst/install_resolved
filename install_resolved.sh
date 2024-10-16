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

echo "systemd-resolved 已成功安装并启用。"
