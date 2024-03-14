-- depends_on: {{ ref('hash_token_lkp') }}

with source_data as (
    select
     raw.details,
   {{ select_for_token(['account_id', 'account_number']) }}
   from
       {{ dbt_unit_testing.source('sample_test_2221_rfn_db','account_raw') }} as raw
   {{ join_for_token(['account_id', 'account_number']) }} )
select *
from source_data