# Smells Tokyo
<img width="1440" alt="スクリーンショット 2020-06-24 18 58 39" src="https://user-images.githubusercontent.com/60377349/85536280-eb060a00-b64d-11ea-8660-80e7b176f6e7.png">

## 🌐 App URL
http://18.176.232.167/
(ドメイン取得中)

## 📝 Description
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
- gretelを用いたパンくずリスト
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

## 💬 Usage
```
$ git clone https://github.com/oznekpark/smellstokyo.git
$ cd smellstokyo
$ bundle install
```
## データベース

