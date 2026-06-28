# VidiPay 1.5M Close Blockers Batch

Current live result:

- Backend: live
- Redis: live and working
- Scanner worker: not heartbeating yet
- Wallet pool: 100001 available, target 1500000
- TON signer/auto payout: not enabled yet

Do this order only:

1. Fix the first scanner Background Worker env.
2. Confirm `/scanner/healthz` shows at least 1 alive worker.
3. Duplicate scanner workers until 4 workers are alive.
4. Import more public wallet addresses until available wallets >= 1500000.
5. Enable TON signer only after keys and RPC are ready.

Render scanner worker settings:

```text
Build Command: npm install --omit=dev
Start Command: npm run start:scanner
Root Directory: empty
Service Type: Background Worker
```

Live checks:

```text
https://vidipay-backend.onrender.com/ops/redis-deep
https://vidipay-backend.onrender.com/scanner/healthz
https://vidipay-backend.onrender.com/ops/scanner-shards
https://vidipay-backend.onrender.com/ops/wallet-capacity
https://vidipay-backend.onrender.com/ops/ton-signer
https://vidipay-backend.onrender.com/ops/final-gate
```

Important:

- Do not upload private keys to GitHub.
- Do not upload `.env.local`.
- Do not upload `node_modules`.
- Use the same `SUPABASE_URL`, `SUPABASE_SERVICE_ROLE_KEY`, `TONAPI_KEY`, and `REDIS_URL` from the live backend env.
