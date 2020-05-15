class UseScene < ApplicationRecord
  has_many :products, dependent: :destroy
end
