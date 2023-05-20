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
| birthday           | date       | null: false                   |



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
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveriesテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| post_code          | string     | null: false                    |
| region_id          | integer    | null: false                    |
| address1           | string     | null: false                    |
| address2           | string     | null: false                    |
| address3           | string     |                                |
| phone              | string     | null: false                    |
| record             | references | null: false, foreign_key: true |

### Association

- belongs_to :record