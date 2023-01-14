{#
    Applies a generic test to a column that compares its values to another and ensures that the two columns are never not-null for the same record.

#}

{% test mutually_exclusive_non_nul_columns(model, column_name, compare_to) %}

select
1
from {{model}}

where {{column_name}} is not null
    and {{compare_to}} is not null

{% endtest%}