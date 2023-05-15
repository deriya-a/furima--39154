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
| birth_year         | enum       | null: false                   |
| birth_month        | enum       | null: false                   |
| birth_date         | enum       | null: false                   |


### Association

- has_many :items
- has_many :records

## itemsテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| name               | string     | null: false                    |
| detail             | text       | null: false                    |
| category           | enum       | null: false                    |
| condition          | enum       | null: false                    |
| delivery_fee       | enum       | null: false                    |
| region             | enum       | null: false                    |
| delivery_within    | enum       | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :records

## recordsテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :deliveries

## deliveriesテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| post_code          | string     | null: false                    |
| address1           | string     | null: false                    |
| address2           | string     | null: false                    |
| address3           | text       | null: false                    |
| address4           | text       | null: true                     |
| phone              | string     | null: false                    |
| record             | references | null: false, foreign_key: true |

### Association

- belongs_to :records