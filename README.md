# Smells Tokyo
## URL
http://18.176.232.167/

## 概要
香水提案アプリです。好みの香りや使用場面、持たせたい印象をリストから選択し、それに合わせておすすめの香水を提案します。また、選択した香水を購入することができます(実取引は不可能です)。

## 作成背景
世の中はたくさんの香りであふれています。
香りは気分を変えてくれたり、リラックスさせてくれたりと生活を豊かにしてくれるものの1つです。
心理学的には人の印象を決定づける一番の要因が香りと言われています。
ところで、皆様は普段から香水を使用しますか？
香水はつける場所や香りによって印象を変えることができます。
ひとつの香水には平均して50〜200種類もの香料が含まれており、更にそれらの香料はまた何百という香りを構成する成分からなっています。
時折、この香水って自分にあってるの？とか、どの香水がいいか分からない、おすすめの香水を教えて欲しい、と思うことありませんか？
このサイトはそういった悩みの手助けとなるべく開設しました。

## 実装
- haml/SASS記法と、命名規則BEMを使ったマークアップ
- deviseを用いたユーザー新規登録とログイン
- cancancanを用いた管理者権限の付与
- rails_adminを用いた管理者ページ作成及び商品登録
- 商品へのコメント機能
- カート機能
- 非同期通信による商品お気に入り機能
- PAY.JPを用いたクレジットカードの登録及び購入処理
- RSpecを使った単体テスト
- capistranoによるAWS EC2への自動デプロイ

## 使用に関して
商品一覧、商品詳細、商品検索、カート機能についてはログインなしで使用可能です。
商品の購入には、新規登録/ログイン、マイページ(my account)でのクレジットカードの登録及び送付先住所の登録が必要です。
ログインにあたっては、以下の登録済みアカウントをご利用いただけます。
- email           :test@gmail.com
- password        :test11

また、クレジットカードについては、以下のテストカードをご利用ください。
※ご自身のカードは使用しないで下さい。

- number          : 5555555555554444
- expiration date : 12/20
- cvc             : 123

購入が完了しますと、マイページの購入履歴から確認ができます。
商品詳細ページのお気に入りボタン(★)を押すと、マイページでお気に入り一覧を確認できます。

## 補足情報
- Ruby 2.5.1
- Ruby on Rails 5.2.4.2

## インストール
```
$ git clone https://github.com/oznekpark/smellstokyo.git
$ cd smellstokyo
$ bundle install
```
## データベース
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
### Association
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
### Association
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
### Association
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
### Association
- belongs_to :user
- has_one :order, dependent: :nullify
### brands table
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
has_many :products, dependent: :destroy
### sexes table
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
has_many :products, dependent: :destroy
### seasons table
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
has_many :products, dependent: :destroy
### smell_impressions table
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
has_many :products, dependent: :destroy
### smell_types table
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
has_many :products, dependent: :destroy
### user_scenes table
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
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
### Association
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
### Association
has_many :line_items, dependent: :destroy
### comments table
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|product|references|foreign_key: true|
|text|text|null: false|
|rate|float|
### Association
belongs_to :product
belongs_to :user
### order_details table
|Column|Type|Options|
|------|----|-------|
|product|references|foreign_key: true|
|order|references|foreign_key: true|
|quantity|integer|null: false|
### Association
- belongs_to :order
- belongs_to :product
### line_items table
|Column|Type|Options|
|------|----|-------|
|product|references|foreign_key: true|
|cart|references|foreign_key: true|
|quantity|integer|default: 0, null: false|
### Association
- belongs_to :product
- belongs_to :cart