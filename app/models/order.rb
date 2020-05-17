class Order < ApplicationRecord
  belongs_to :user
  has_many :products, through: :order_details
  has_many :order_details, dependent: :destroy
  belongs_to :card
  belongs_to :address

  enum postage: {burden: 0, free: 1}
  enum stutas: {registered: 0, payed: 1, delivered: 2}

  # validates_presence_of :name, :address, message: "を入力して下さい。"

  def add_items(cart)
    cart.line_items.target.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

end
