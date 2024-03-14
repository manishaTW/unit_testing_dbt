{% macro join_for_token(column_name_list) %}

{%- for col in column_name_list -%}
    {{'\n'}}
    LEFT JOIN {{ dbt_unit_testing.ref('hash_token_lkp') }} as lkp{{ col }} on
    lkp{{ col }}.hash=raw.{{ col }}
    {%- if not loop.last %}
        {{'\n'}}
    {% endif %}
    {%- endfor -%}
{% endmacro %}