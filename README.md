# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


------------------------------------------------------------------------



## users テーブル

| Column                  | Type   | Options                  |
| ----------------------- | ------ | ------------------------ |
| email                   | string | null: false, unique: true|
| encrypted_password      | string | null: false              |
| name                    | string | null: false              |
| last_name               | string | null: false              |
| first_name              | string | null: false              |
| last_name_kana          | string | null: false              |
| first_name_kana         | string | null: false              |
| birth_date              | date   | null: false              |


### Association

- has_many :items
- has_many :orders


## items テーブル

| Column                 | Type          | Options     |
| ---------------------- | ------------- | ----------- |
| name                   | string        | null: false |
| info                   | text          | null: false |
| category_id            | integer       | null: false |
| status_id              | integer       | null: false |
| shipping_fee_id        | integer       | null: false |
| prefecture_id          | integer       | null: false |
| scheduled_delivery_id  | integer       | null: false |
| price                  | integer       | null: false |
| user                   | references    |             |

### Association

- belongs_to :user
- has_one    :order
- has_one    :address



## orders テーブル

| Column                 | Type          | Options     |
| -----------------------| ------------- | ----------- |
| user                   | references    |             |
| item                   | references    |             |


### Association

- belongs_to :user
- belongs_to :item
- has_one    :address



## addresses テーブル

| Column                   | Type      | Options     |
| ------------------------ | --------- | ----------- |
| postal_code              | integer   | null: false |
| prefecture_id            | integer   | null: false |
| city                     | string    | null: false |
| address                  | text      | null: false |
| building                 | text      |             |
| phone_number             | integer   | null: false |
| order                    | reference |             |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :order

