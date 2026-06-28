# Upload This To Scanner Worker Repo

Purpose: same 1.5M fast ops server code for scanner workers.

Render settings:

```text
Service Type: Background Worker
Build Command: npm install --omit=dev
Start Command: npm run start:scanner
Root Directory: empty
```

Common scanner env:

```env
WORKER_MODE=scanner
SCANNER_WORKER_MODE=true
PAYMENT_SCANNER_ENABLED=true
RATE_LIMIT_BACKEND=redis
REDIS_SCANNER_LOCKS_ENABLED=true
SCANNER_HEARTBEAT_CACHE_TTL_MS=1500
WALLET_CAPACITY_CACHE_TTL_MS=15000
SCANNER_BACKLOG_CACHE_TTL_MS=10000
REDIS_HEALTH_CACHE_TTL_MS=5000
OPS_SNAPSHOT_CACHE_TTL_MS=3000
OPS_DB_AUDIT_TIMEOUT_MS=5000
SCALE_AUDIT_COUNT_MODE=planned
```

For 4 workers:

```env
PAYMENT_SCANNER_SHARD_COUNT=4
PAYMENT_SCANNER_SHARD_INDEX=0
PAYMENT_SCANNER_WORKER_ID=vidipay-scanner-000
```

Duplicate workers must use index `1`, `2`, and `3`.
