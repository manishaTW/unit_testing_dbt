{% macro get_token_by_hash(table_name, column_name) %}
    (
    select token
        from {{ ref('hash_token_lkp') }}
         where hash in (
            select {{ column_name }} from {{ source('sample_test_2221_rfn_db',table_name) }}
    )
    )
{% endmacro %}