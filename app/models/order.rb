class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  enum postage: {burden: 0, free: 1}
  enum stutas: {registered: 0, payed: 1, delivered: 2}
end
