select
  'duplicate_live_shards' as check_name,
  shard_index,
  count(*) as live_workers
from public.payment_scanner_heartbeats
where last_seen_at > now() - interval '30 seconds'
group by shard_index
having count(*) > 1
order by shard_index;

select
  'missing_live_shards_0_to_3' as check_name,
  s.shard_index
from generate_series(0, 3) as s(shard_index)
left join public.payment_scanner_heartbeats h
  on h.shard_index = s.shard_index
 and h.last_seen_at > now() - interval '30 seconds'
where h.shard_index is null
order by s.shard_index;
