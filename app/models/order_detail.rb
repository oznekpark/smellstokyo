class OrderDetail < ApplicationRecord
  # Orderモデルから当該モデルへ購入処理時にカート情報を引き継ぐためのメソッド
  def self.create_items(order, line_items)
    OrderDetail.create!(
      order_id: order.id, product_id: item.product_id, quantity: item.quantity
    )
    LineItem.find(item.id).delete
  end

  # 商品の小計金額を表示するためのメソッド
  def total_price
    product.price * quantity
  end
end
