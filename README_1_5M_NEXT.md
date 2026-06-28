select
  'pending_orders_without_wallet' as check_name,
  count(*) as count
from public.payment_orders o
left join public.payment_wallets w on w.id = o.wallet_id
where o.status = 'pending'
  and w.id is null;

select
  'pending_orders_backlog' as check_name,
  count(*) as pending_count,
  min(created_at) as oldest_pending,
  max(created_at) as newest_pending
from public.payment_orders
where status = 'pending';
