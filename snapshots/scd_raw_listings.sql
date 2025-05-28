{% snapshot scd_raw_listings %}
{{
 config(
 unique_key='id',
 strategy='timestamp',
 updated_at='updated_at'
 )
}}
select * FROM {{ source('ANALYTICS', 'listings') }}
{% endsnapshot %}