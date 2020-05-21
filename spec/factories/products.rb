FactoryBot.define do
  factory :product do
    name                 {"シャネル"}
    description          {"おすすめ"}
    image                {"1"}
    price                {"10000"}
    stock_quantity       {"10"}
    brand_id             {"1"}
    sex_id               {"1"}
    season_id            {"1"}
    smell_type_id        {"1"}
    main_spice_id        {"1"}
    smell_impression_id  {"1"}
    use_scene_id         {"1"}
  end
end