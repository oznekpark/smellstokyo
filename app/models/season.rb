class Season < ApplicationRecord
  has_many :products, dependent: :destroy
end
