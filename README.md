# Smells Tokyo
![homepege](https://i.gyazo.com/1980666ab5b5931ecd2c30dace5c9239.jpg)
![select](https://i.gyazo.com/3a4b2382b5a7c12936ec9942623eb66d.png)
## Description
This is mainly EC site that you are able to pick perfumes you like and purcahse by a test credit card.
On top of that, this may suggest you perfumes you would like to use or you are looking for!
※ Real transaction is impossible.
※ never use your own credit card.
  use the following test card.
  number          : 5555555555554444
  brand           : MasterCard
  expiration date : 12/20
  cvc             : 123

## Requirement
- Ruby 2.5.1
- Ruby on Rails 5.2.4.2

## Install

```
$ git clone https://github.com/oznekpark/smellstokyo.git
$ cd smellstokyo
$ bundle install
```
## database
### users table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|default: "", null: false|
|password|string|null: false|
|encrypted_password|string|default: "", null: false|
|reset_password_token|string||
|reset_password_token|string||
|admin|boolean|default: false|
#### Association
- has_many :comments, dependent: :destroy
- has_one :card, dependent: :destroy
- has_one :address, dependent: :destroy
- has_many :orders, dependent: :nullify
### orders table
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|card|references|foreign_key: true|
|product|references|foreign_key: true|
|quantity|integer|null: false|
|status|integer|default: 0, null: false|
|postage|integer|default: 0, null: false|
|price|integer|null: false|
#### Association
- belongs_to :user
- has_many :products, through: :order_details
- has_many :order_details, dependent: :destroy
- belongs_to :card
- belongs_to :address
### cards table
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|string|null: false|
#### Association
- belongs_to :user
- has_one :order, dependent: :nullify
### addresses table
|Column|Type|Options|
|------|----|-------|
|destination_family_name|string|null: false|
|destination_first_name|string|null: false|
|destination_family_name_kana|string|null: false|
|destination_family_name_kana|string|null: false|
|postcode|integer|null: false|
|prefecture_code|string|null: false|
|address_city|string|null: false|
|address_street|string|null: false|
|address_building|string||
|phone_number|bigint||
|user|references|foreign_key: true, null: false|
#### Association
- belongs_to :user
- has_one :order, dependent: :nullify
### brands table
|Column|Type|Options|
|------|----|-------|
|name|string||
#### Association
has_many :products, dependent: :destroy
### sexes table
|Column|Type|Options|
|------|----|-------|
|name|string||
#### Association
has_many :products, dependent: :destroy
### seasons table
|Column|Type|Options|
|------|----|-------|
|name|string||
#### Association
has_many :products, dependent: :destroy
### smell_impressions table
|Column|Type|Options|
|------|----|-------|
|name|string||
#### Association
has_many :products, dependent: :destroy
### smell_types table
|Column|Type|Options|
|------|----|-------|
|name|string||
#### Association
has_many :products, dependent: :destroy
### user_scenes table
|Column|Type|Options|
|------|----|-------|
|name|string||
#### Association
has_many :products, dependent: :destroy
### products table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|namelap|string|null: false|
|description|text||
|image|text||
|price|integer||
|stock_quantity||
|brand|references|foreign_key: true|
|sex|references|foreign_key: true|
|season|references|foreign_key: true|
|smell_type|references|foreign_key: true|
|main_spice|references|foreign_key: true|
|smell_impression|references|foreign_key: true|
|use_scene|references|foreign_key: true|
#### Association
- belongs_to :brand
- belongs_to :sex
- belongs_to :season, optional: true
- belongs_to :smell_type
- belongs_to :main_spice
- belongs_to :smell_impression
- belongs_to :use_scene
- has_many :comments, dependent: :destroy
- has_many :order_details
- has_many :orders, through: :order_details
- has_many :line_items, dependent: :destroy
### carts table
|Column|Type|Options|
|------|----|-------|
#### Association
has_many :line_items, dependent: :destroy
### comments table
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|product|references|foreign_key: true|
|text|text|null: false|
|rate|float|
#### Association
belongs_to :product
belongs_to :user
### order_details table
|Column|Type|Options|
|------|----|-------|
|product|references|foreign_key: true|
|order|references|foreign_key: true|
|quantity|integer|null: false|
#### Association
- belongs_to :order
- belongs_to :product
### line_items table
|Column|Type|Options|
|------|----|-------|
|product|references|foreign_key: true|
|cart|references|foreign_key: true|
|quantity|integer|default: 0, null: false|
#### Association
- belongs_to :product
- belongs_to :cart