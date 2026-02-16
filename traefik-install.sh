mkdir -p /opt/traefik && cd /opt/traefik && \
cat > docker-compose.yml << 'EOF'
services:
  traefik:
    image: traefik:latest
    container_name: traefik
    restart: unless-stopped
    ports:
      - "8080:8080"
    command:
      - "--api.dashboard=true"
      - "--api.insecure=true"
      - "--providers.docker=true"
      - "--providers.docker.exposedbydefault=false"
      - "--entrypoints.web.address=:8080"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
EOF

docker compose up -d
