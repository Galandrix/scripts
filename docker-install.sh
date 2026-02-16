#!/usr/bin/env bash
set -e  # stop execution if any command returns non-zero status

apt update
apt upgrade -y
apt install -y ca-certificates gnupg lsb-release

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

cat > /etc/apt/sources.list.d/docker.list <<'EOF'
deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable
EOF

apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

docker --version
docker compose version
