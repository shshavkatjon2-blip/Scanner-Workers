# Wallet Pool Next Step

Current live:

```text
available_wallets=100001
target_wallets=1500000
missing=1399999
```

Next goal:

- Generate/import public TON wallet addresses only.
- Private keys and mnemonics must stay offline.
- Supabase should receive public address SQL only.

Use existing import shape:

```sql
insert into public.payment_wallets (network, token, address)
values ('TON', 'TON', 'EQ...')
on conflict (address) do nothing;
```

After import, verify:

```text
https://vidipay-backend.onrender.com/ops/wallet-capacity
```

Expected:

```text
available_wallets >= 1500000
capacity_gap >= 0
```
