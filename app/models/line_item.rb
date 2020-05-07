class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  #商品ごとの小計金額を表示させるメソッド
  def total_price
    product.price * quantity
  end
end
