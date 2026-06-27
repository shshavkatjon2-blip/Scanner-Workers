# Upload this hyperscale package to Render Background Workers only

This package is for the payment scanner worker pool.

- Render service type: Background Worker
- Build command: `npm ci --omit=dev`
- Start command: `npm run start:scanner`
- Expected version: `v1.8.1-hyperscale-backpressure-20260627`

Use the included blueprint:

```text
render.hyperscale-256-workers.yaml
```

It defines 256 scanner workers:

```text
scanner-hyperscale-0 ... scanner-hyperscale-255
PAYMENT_SCANNER_SHARD_COUNT=256
PAYMENT_SCANNER_SHARD_INDEX=0..255
PAYMENT_SCAN_INTERVAL_MS=3000
PAYMENT_SCAN_BATCH_SIZE=500
PAYMENT_SCAN_CONCURRENCY=32
PAYMENT_SCAN_JITTER_MS=2500
PAYMENT_SCAN_ORDER_DELAY_MS=10
PAYMENT_SCAN_MAX_ERRORS_PER_RUN=500
```

Do not upload this package to the Web Service.

After deploy, check:

```text
https://vidipay-backend.onrender.com/scanner/healthz
https://vidipay-backend.onrender.com/ops/hyperscale
```

Expected: `scanner_workers_alive` should move toward `256`.
