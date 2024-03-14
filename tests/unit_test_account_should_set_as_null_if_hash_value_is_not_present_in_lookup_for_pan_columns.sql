-- depends_on: {{ ref('hash_token_lkp') }}

{{ config(tags=['unit-test']) }}

{% call dbt_unit_testing.test('account_v2', 'should_set_as_null_if_hash_value_is_not_present_in_lookup_for_pan_columns') %}

  {% call dbt_unit_testing.mock_source ('sample_test_2221_rfn_db','account_raw') %}
    select 3 as account_id, 'abc' as details,4 as account_number
    {% endcall %}

  {% call dbt_unit_testing.mock_ref ('hash_token_lkp') %}
select 1 as hash, 'token1' as token
UNION ALL
select 2 as hash, 'token2' as token
    {% endcall %}

  {% call dbt_unit_testing.expect() %}
select null as account_id, 'abc' as details,null as account_number
    {% endcall %}
{% endcall %}