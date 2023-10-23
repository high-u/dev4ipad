# dev4ipad

## Usage

### Prerequisite

- Own the domain.
- Starting a linux server.
- Node.js is installed.
- Docker Compose is installed.

### Reverse Proxy

```bash
vim caddy/config/Caddyfile

docker compose -f docker-compose.reverseproxy.yaml up -d
```

### Code Server

```bash
npm i -g argon2-cli
ARGON2=$(echo -n "password" | npx argon2-cli -e)
echo $ARGON2
# ex.
# $argon2i$v=19$m=4096,t=3,p=1$ZFw3rh7n8UT6ZokcCCWkvw$FOreo3r8BXKtgROresDrfIWA3iUO+3RLmbyUqqlDSU8
HPW=${ARGON2//'$'/'$$'}
sed -i -e "s/HASHED_PASSWORD=.*$/HASHED_PASSWORD=${HPW}/g" docker-compose.codeserver.yaml

docker compose -f docker-compose.codeserver.yaml up -d
```

