{#
    Applies a generic test that the column in question is either null or greater than or equal to zero.
#}

{% test null_or_not_negative(model, column_name) %}

select
    1
from {{model}}

where not(coalesce({{column_name}}, 0) > = 0)

{% endtest%}