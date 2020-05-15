class SmellImpression < ApplicationRecord
  has_many :products, dependent: :destroy
end
