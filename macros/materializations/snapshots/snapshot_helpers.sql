{% macro build_snapshot_staging_table_iceberg(strategy, sql, target_relation) %}
    {% set temp_relation = make_temp_relation(target_relation) %}

    {% set select = snapshot_staging_table(strategy, sql, target_relation) %}

    {% call statement('build_snapshot_staging_relation') %}
        {{ create_table_as(False, temp_relation, select) }}
    {% endcall %}

    {% do return(temp_relation) %}
{% endmacro %}

{% macro snowflake__current_timestamp() -%}
  convert_timezone('UTC', current_timestamp(6))
{%- endmacro %}

{% macro snowflake__snapshot_get_time() -%}
  to_timestamp_ntz({{ current_timestamp() }})::TIMESTAMP_NTZ(6)
{%- endmacro %}