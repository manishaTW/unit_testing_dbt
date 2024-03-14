{% macro select_for_token(column_name_list) %}

{%- for col in column_name_list -%}
{{'\n'}}
lkp{{ col }}.token as {{col}}
 {%- if not loop.last %}
    {{','}}
{% endif %}
    {%- endfor -%}

{% endmacro %}