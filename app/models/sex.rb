class Sex < ApplicationRecord
  has_many :products, dependent: :destroy
end
