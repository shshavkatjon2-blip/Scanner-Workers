# Scanner Worker Failure Map

If Render says `Missing script: start:scanner`:

- GitHub repo root has wrong `package.json`.
- Upload the contents of `SCANNER_UPLOAD_THIS_CONTENTS_NOT_ZIP`, not the zip itself.
- `package.json` must contain `"start:scanner": "node scripts/start-scanner.js"`.

If Render says `Cannot start VidiPay payment scanner`:

- One of these env values is missing or still placeholder:
  - `SUPABASE_URL`
  - `SUPABASE_SERVICE_ROLE_KEY`
  - `TONAPI_KEY`
  - `TONAPI_BASE_URL`

If live endpoint still says `scanner_workers_alive=0`:

- Worker is not a Background Worker, or it crashed after boot.
- Start command must be exactly `npm run start:scanner`.
- Worker env must use the same Supabase project as backend.
- Check Render worker logs for the first red error line.

If duplicate shard appears:

- Two workers have the same `PAYMENT_SCANNER_SHARD_INDEX`.
- Keep `PAYMENT_SCANNER_SHARD_COUNT=4` on all four workers.
- Use indexes `0`, `1`, `2`, `3`.
