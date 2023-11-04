# dev4ipad

## Usage

### Prerequisite

- Own the domain.
- Starting a linux server.
- Node.js is installed on the linux server.
- Docker Compose is installed on the linux server.

### DNS Records

ex. CLOUDFLARE

|Type|Name|Content|Proxy status|TTL|
|:--|:--|:--|:--|:--|
|A|*.apps|123.123.123.123|DNS only|Auto|

### Docker resources

```bash
docker network create reverseproxy
docker volume create caddy_data
```

### Execute

```bash
CODE_SERVER_HASHED_PASSWORD=$(echo -n 'password' | sha256sum | cut -d' ' -f1)
# https://github.com/coder/code-server/blob/v3.8.0/doc/FAQ.md#can-i-store-my-password-hashed
# https://github.com/coder/code-server/issues/2225
#
# Hashed password generation on macOS
# `docker run ubuntu bash -c "echo -n 'password' | sha256sum | cut -d' ' -f1"`

echo "CODE_SERVER_HASHED_PASSWORD=${CODE_SERVER_HASHED_PASSWORD}" > .env

docker compose up -d
```
