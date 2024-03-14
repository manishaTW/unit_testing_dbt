with
    input as (
        select
            0 as id,
            10
              as input_col,
            20.00
              as expected_output_col
        union all
        select
            1 as id,
            20
              as input_col,
            30.00
              as expected_output_col
    ),
    macro_output as (
        select id,   {{ cents_to_dollars('input_col') }} as macro_output_col from input
    )
select input.id, input_col, expected_output_col, macro_output_col
from input
         join macro_output on input.id = macro_output.id
where macro_output.macro_output_col != input.expected_output_col