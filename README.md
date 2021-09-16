# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false               |
| encrypted_password | string | null: false, unique: true |
| last_name          | string | null: false               |
| first_name         | string | null: false               | 
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| text               | text       | null: false                    |
| category           | string     | null: false                    |
| status             | string     | null: false                    |
| price              | integer    | null: false                    |
| shipping_fee       | string     | null: false                    |
| area               | string     | null: false                    |
| delivery_days      | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :shipping_address

## shipping_addresses テーブル

| Column         | Type       | Options                        |
| -----------    | ---------- | ------------------------------ |
| postcode       | integer    | null: false                    |
| prefecture_id  | string     | null: false                    |
| city           | string     | null: false                    |
| block          | string     | null: false                    |
| building       | string     |                                |
| phone_number   | integer    | null: false                    |
| order          | references | null: false, foreign_key: true |
### Association

- belongs_to :order