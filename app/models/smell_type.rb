class SmellType < ApplicationRecord
  has_many :products, dependent: :destroy
end
