class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  def add_product(product_id)
    line_items.find_or_initialize_by(product_id: product_id)
  end

  def total_price
    line_items.to_a.sum{|item| item.total_price}
  end

  def total_number
    line_items.to_a.sum{|item| item.quantity}
  end
end
