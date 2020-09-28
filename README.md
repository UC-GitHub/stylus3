# README
# テーブル設計

## users テーブル

| Column                      | Type    | Options     |
| --------------------------- | ------- | ----------- |
| nickname                    | string  | null: false |
| email                       | string  | null: false |
| encrypted_password          | string  | null: false |
| family_name                 | string  | null: false |
| first_name                  | string  | null: false |
| kana_family_name            | string  | null: false |
| kana_first_name             | string  | null: false |
| birthday                    | date    | null: false |
| postal_code                 | string  | null: false |
| prefecture_id (Active Hush) | integer | null: false |
| city                        | string  | null: false |
| street_address              | string  | null: false |
| building                    | integer | null: true  |
| phone_number                | string  | null: false |
| shoe_size                   | integer | null: false |

### Association

- has_many :orders

## suppliers テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| display_name          | string  | null: false |
| company_name          | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| person_in_charge      | string  | null: false |
| kana_person_in_charge | string  | null: false |
| postal_code           | string  | null: false |
| prefecture_id         | integer | null: false |
| city                  | string  | null: false |
| street_address        | string  | null: false |
| building              | integer | null: true  |
| company_phone_number  | string  | null: false |
| mobile                | string  | null: true  |

### Association

- has_many :styles

## styles テーブル

| Column                         | Type       | Options                        |
| ------------------------------ | ---------- | ------------------------------ |
| name                           | string     | null: false                    |
| type_id (Active Hush)          | integer    | null: false                    |
| season_id (Active Hush)        | integer    | null: false                    |
| height_id (Active Hush)        | integer    | null: false                    |
| body_figure_id (Active Hush)   | integer    | null: false                    |
| shipping_date_id (Active Hush) | integer    | null: false                    |
| description                    | text       | null: false                    |
| tops1_price                    | integer    | null: false                    |
| tops2_price                    | integer    | null: true                     |
| tops3_price                    | integer    | null: true                     |
| tops4_price                    | integer    | null: true                     |
| tops5_price                    | integer    | null: true                     |
| bottoms_price                  | integer    | null: false                    |
| socks_price                    | integer    | null: true                     |
| shoes_price                    | integer    | null: true                     |
| accessories1_price             | integer    | null: true                     |
| accessories2_price             | integer    | null: true                     |
| accessories3_price             | integer    | null: true                     |
| total_price                    | integer    | null: false                    |
| supplier                       | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :supplier

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| style  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :style