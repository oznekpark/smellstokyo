FactoryBot.define do
  factory :address do
    destination_first_name       {"佐藤"}
    destination_family_name      {"宗"}
    destination_first_name_kana  {"さとう"}
    destination_family_name_kana {"たかし"}
    postcode                     {"1500041"}
    prefecture_code              {"東京都"}
    address_city                 {"千代田区"}
    address_street               {"神田1-1"}
    address_building             {"内神田ビル"}
    phone_number                 {"09012345678"}
    user
  end
end