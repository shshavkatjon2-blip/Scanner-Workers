# Scanner Render Settings

Create 4 Render Background Worker services from the same scanner repo.

Build Command:

```text
npm install --omit=dev
```

Start Command:

```text
npm run start:scanner
```

Root Directory:

```text

```

Keep Root Directory empty.

For every worker, paste all keys from:

```text
env/SCANNER_COMMON_ENV_RENDER.env
```

Then add one shard env:

- Worker 0: `env/scanner-000.env`
- Worker 1: `env/scanner-001.env`
- Worker 2: `env/scanner-002.env`
- Worker 3: `env/scanner-003.env`

Do not reuse the same `PAYMENT_SCANNER_SHARD_INDEX` twice.
