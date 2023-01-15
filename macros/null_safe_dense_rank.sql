{#
    Syntax: Databricks SQL
    Applies a dense_rank function, but returns null where the partition column (or null_safe column) is null
    The 'null_safe_col' parameter allows for a not-null condition that is different from the partition column. Default equals the partition column.
#}

{% macro null_safe_dense_rank(
    partition_col = none,
    order_col = none,
    rank_direction = 'asc',
    null_safe_col = partition_col
) %}

    if( {{null_safe_col}} is null, null, dense_rank() over (partition by {{partition_col}} order by {{order_col}} {{rank_direction}}) )

{% endmacro %}
