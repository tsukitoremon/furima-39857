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
| birthday               | integer | null: false               |

### Association

- has_many :item
- has_many :comment
- has_many :order

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| price         | integer    | null: false                    |
| good_btn      | integer    |                                |
| content       | text       | null: false                    |
| delivery_date | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :comment
- has_many :recipient

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| seller       | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
| price        | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :recipient

## recipients テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| buyer        | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
| post_code    | string     | null: false                    |
| tel_number   | string     | null: false                    |
| address      | string     | null: false                    |

### Association

- belongs_to :item
- belongs_to :order

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item