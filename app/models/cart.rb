class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  # Cartモデルに商品（LineItem）を登録するメソッド（カート登録機能の実装）
  def add_product(product_id)
    line_items.find_or_initialize_by(product_id: product_id)
  end

  #Cartモデルにカートに含まれる全ての商品の合計金額を表示させるためのメソッド
  def total_price
    line_items.to_a.sum{|item| item.total_price}
  end

  #Cartモデルに商品合計個数を表示させるためのメソッド
  def total_number
    line_items.to_a.sum{|item| item.quantity}
  end
end
