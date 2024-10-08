{% macro default__generate_schema_name(custom_schema_name, node) -%}
    {{ log("Custom generate_schema_name called!", info=True) }}
    {%- set default_schema = target.schema -%}

    {%- if env_var('DBT_CLOUD_ENVIRONMENT_TYPE') == 'dev' -%}
        {%- if custom_schema_name is none -%}

            {{ default_schema }}

        {%- else -%}

            {{ default_schema }}_{{ custom_schema_name | trim }}

        {%- endif -%}

    {% else %}
        {%- if custom_schema_name is none -%}

            {{ default_schema }}

        {%- else -%}

            {{ custom_schema_name | trim }}

        {%- endif -%}
    {% endif %}
{%- endmacro %}

{% macro snowflake__generate_schema_name(custom_schema_name, node) -%}
    {{ log("Custom generate_schema_name called!", info=True) }}
    {%- set default_schema = target.schema -%}

    {%- if env_var('DBT_CLOUD_ENVIRONMENT_TYPE') == 'dev' -%}
        {%- if custom_schema_name is none -%}

            {{ default_schema }}

        {%- else -%}

            {{ default_schema }}_{{ custom_schema_name | trim }}

        {%- endif -%}

    {% else %}
        {%- if custom_schema_name is none -%}

            {{ default_schema }}

        {%- else -%}

            {{ custom_schema_name | trim }}

        {%- endif -%}
    {% endif %}
{%- endmacro %}

{% macro generate_schema_name(custom_schema_name, node) -%}
    {{ log("Custom generate_schema_name called!", info=True) }}
    {%- set default_schema = target.schema -%}

    {%- if env_var('DBT_CLOUD_ENVIRONMENT_TYPE') == 'dev' -%}
        {%- if custom_schema_name is none -%}

            {{ default_schema }}

        {%- else -%}

            {{ default_schema }}_{{ custom_schema_name | trim }}

        {%- endif -%}

    {% else %}
        {%- if custom_schema_name is none -%}

            {{ default_schema }}

        {%- else -%}

            {{ custom_schema_name | trim }}

        {%- endif -%}
    {% endif %}
{%- endmacro %}

{% macro adi_common__generate_schema_name(custom_schema_name, node) -%}
    {{ log("Custom generate_schema_name called!", info=True) }}
    {%- set default_schema = target.schema -%}

    {%- if env_var('DBT_CLOUD_ENVIRONMENT_TYPE') == 'dev' -%}
        {%- if custom_schema_name is none -%}

            {{ default_schema }}

        {%- else -%}

            {{ default_schema }}_{{ custom_schema_name | trim }}

        {%- endif -%}

    {% else %}
        {%- if custom_schema_name is none -%}

            {{ default_schema }}

        {%- else -%}

            {{ custom_schema_name | trim }}

        {%- endif -%}
    {% endif %}
{%- endmacro %}
