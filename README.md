# README

## usersテーブル

| Column             | Type       | Options                       |
|--------------------|------------|-------------------------------|
| nickname           | string     | null: false                   |
| email              | string     | null: false, unique: true     |
| encrypted_password | string     | null: false                   |
| family_name_kanji  | string     | null: false                   |
| first_name_kanji   | string     | null: false                   |
| family_name_kana   | string     | null: false                   |
| first_name_kana    | string     | null: false                   |
| birthday           | data       | null: false                   |



### Association

- has_many :items
- has_many :records

## itemsテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| name               | string     | null: false                    |
| detail             | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_fee_id    | integer    | null: false                    |
| region_id          | integer    | null: false                    |
| delivery_within_id | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :record

## recordsテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveriesテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| post_code          | string     | null: false                    |
| address1_id        | integer    | null: false                    |
| address2           | string     | null: false                    |
| address3           | text       | null: false                    |
| address4           | text       |                                |
| phone              | string     | null: false                    |
| record             | references | null: false, foreign_key: true |

### Association

- belongs_to :record