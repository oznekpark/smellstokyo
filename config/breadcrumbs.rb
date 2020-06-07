crumb :root do
  link "HOME", root_path
end

crumb :products do
  link "SELECT", products_path
  parent :root
end

crumb :womenproducts do
  link "WOMEN", indexOfWomenProducts_products_path
  parent :root
end

crumb :menproducts do
  link "MEN", indexOfMenProducts_products_path
  parent :root
end

crumb :product do |product|
  link product.namejap, product_path(product)
  parent :products, :womenproducts, :menproducts
end

crumb :mypage do
  link "MY ACCOUNT", user_path(current_user)
end

crumb :favorite do
  link "お気に入り", bookmarks_path
  parent :mypage
end

crumb :order do
  link "注文履歴", orders_path
  parent :mypage
end

crumb :orderdetail do |order|
  link "注文履歴詳細", order_details_path(order)
  parent :order
end

crumb :address do
  link "送付先住所", addresses_path
  parent :mypage
end

crumb :card do
  link "支払い方法", new_card_path
  parent :mypage
end

crumb :accountmodify do
  link "アカウント修正", edit_user_registration_path
  parent :mypage
end
