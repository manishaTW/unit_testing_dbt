-- depends_on: {{ ref('hash_token_lkp') }}

with source_data as (
    select  details,
   {{ get_token_by_hash('account_raw','account_id') }} as account_id,
   {{ get_token_by_hash('account_raw','account_number') }} as account_number
   from
       account_raw
    )
select *
from source_data