# README
# テーブル設計

## users テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false |
| encrypted_password     | string | null: false |
| first_name             | string | null: false |
| last_name              | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| good_btn     | integer    |                                |
| content      | text       | null: false                    |

### Association

- belongs_to :users
- has_many :comments
- has_many :orders

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
| post_code    | integer    | null: false                    |
| tel_number   | integer    | null: false                    |
| address      | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item