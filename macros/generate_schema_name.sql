{% macro generate_database_name(custom_database_name=none, node=none) -%}

    {%- set default_database = target.database -%}
    {%- if env_var('DBT_CLOUD_ENVIRONMENT_TYPE') == 'dev' -%}

        {{ default_database }}

    {%- elif env_var('DBT_DEFAULT_CATALOG').endswith('_uat') -%}

        {{ default_database }}

    {% else %}
        {%- if custom_database_name is none -%}

            {{ default_database }}

        {%- else -%}

            {{ custom_database_name | trim }}

        {%- endif -%}
    {%- endif -%}

{%- endmacro %}