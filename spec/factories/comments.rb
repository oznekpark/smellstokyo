FactoryBot.define do
  factory :comment do
    text       {Faker::Lorem.sentence}
    rate       {"5.0"}
    user
    product
  end
end