select
  'scanner_heartbeat_audit' as check_name,
  count(*) as rows_seen,
  count(*) filter (where last_seen_at > now() - interval '30 seconds') as alive_30s,
  count(distinct shard_index) filter (where last_seen_at > now() - interval '30 seconds') as active_shards_30s,
  max(last_seen_at) as latest_seen_at
from public.payment_scanner_heartbeats;

select
  worker_id,
  worker_mode,
  shard_count,
  shard_index,
  last_seen_at,
  last_error
from public.payment_scanner_heartbeats
order by last_seen_at desc nulls last
limit 20;
