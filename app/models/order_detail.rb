class OrderDetail < ApplicationRecord
  # OrderDetailで購入処理を行っていく
  # OrderモデルからOrderDetailモデルへ購入処理時にカート情報を引き継ぐためのメソッド
  def self.create_items(order, line_items)
    line_items.each do |item|
      OrderDetail.create!(
        order_id: order.id, product_id: item.product_id, quantity: item.quantity
      )
      LineItem.find(item.id).delete
    end
  end

  # 商品の小計金額を表示するためのメソッド
  def total_price
    product.price * quantity
  end
end
