select
  'wallet_duplicate_groups' as check_name,
  count(*) as duplicate_groups
from (
  select address
  from public.payment_wallets
  where address is not null
  group by address
  having count(*) > 1
) d;

select
  address,
  count(*) as duplicate_count
from public.payment_wallets
where address is not null
group by address
having count(*) > 1
order by duplicate_count desc, address asc
limit 20;
