class Address < ApplicationRecord
  belongs_to :user

  VALID_PHONE_REGEX = /\A\d{10,11}\z/
  VALID_NAME_REGEX = /\A[一-龥ぁ-ん]/
  VALID_KANA_REGEX = /\A[ぁ-んー－]+\z/
  validates :destination_first_name, :destination_family_name, :destination_first_name_kana, :destination_family_name_kana, :postcode, :prefecture_code, :address_city, :address_street, presence: true
  validates :destination_first_name, :destination_family_name, format: { with: VALID_NAME_REGEX }
  validates :destination_first_name_kana, :destination_family_name_kana, format: { with: VALID_KANA_REGEX }
  
end
