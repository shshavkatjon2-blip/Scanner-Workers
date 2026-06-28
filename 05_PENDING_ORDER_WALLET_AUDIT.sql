select
  'wallet_capacity' as check_name,
  count(*) as total_wallets,
  count(*) filter (where coalesce(is_active, true) = true) as active_wallets,
  count(*) filter (
    where coalesce(is_active, true) = true
      and assigned_to_telegram_id is null
  ) as available_wallets,
  greatest(
    1500000 - count(*) filter (
      where coalesce(is_active, true) = true
        and assigned_to_telegram_id is null
    ),
    0
  ) as missing_for_1_5m
from public.payment_wallets;
