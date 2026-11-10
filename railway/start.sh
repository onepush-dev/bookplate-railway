#!/bin/sh
# Railway mounts volumes root-owned: give /data/uploads to the `node` user, create the owner
# account once the server is up, then run Bookplate exactly as upstream does, as `node`.
set -eu
mkdir -p /data/uploads
chown -R node:node /data/uploads 2>/dev/null || true
if [ -n "${BOOKPLATE_OWNER_PASSWORD:-}" ]; then
  su-exec node node /app/railway-bootstrap.mjs &
fi
cd /app
exec su-exec node node server.js
