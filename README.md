# README
# テーブル設計

## users テーブル

| Column                 | Type    | Options                   |
| ---------------------- | ------- | ------------------------- |
| nickname               | string  | null: false               |
| email                  | string  | null: false, unique: true |
| encrypted_password     | string  | null: false               |
| first_name             | string  | null: false               |
| last_name              | string  | null: false               |
| first_name_yomi        | string  | null: false               |
| last_name_yomi         | string  | null: false               |
| birthday               | date    | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item             | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| price            | integer    | null: false                    |
| content          | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_from_id_id | integer    | null: false                    |
| delivery_date_id_id | integer    | null: false                    |
| delivery_cost_id_id | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :recipient

## recipients テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| price            | integer    | null: false                    |
| post_code        | string     | null: false                    |
| tel_number       | string     | null: false                    |
| delivery_from_id_id | integer    | null: false                    |
| address_city     | string     | null: false                    |
| address_street   | string     | null: false                    |
| address_building | string     |                                |

### Association

- belongs_to :order
