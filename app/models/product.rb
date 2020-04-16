class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :sex
  belongs_to :season
  belongs_to :smell_type
  belongs_to :main_spice
  belongs_to :smell_impression
  belongs_to :use_scene
  validates :name, :description, :image, presence: true

  belongs_to :user

  enum brand_id: {
    "---": 0,
    BURBERRY: 1,
    DIOR: 2,
    CHANEL: 3,
    "JO MALONE": 4,
    Aesop: 5,
    shiro: 6
  },  _prefix: true

  enum sex_id: {
    "---": 0,
    "女性": 1,
    "男性": 2,
    "ユニセックス": 3,
  },  _prefix: true

  enum seoson_id: {
    "---": 0,
    "春": 1,
    "夏": 2,
    "秋": 3,
    "冬": 4,
  },  _prefix: true

  enum smell_type_id: {
    "---": 0,
    "フルーティー": 1,
    "フローラル": 2,
    "ウッディ&オリエンタル": 3,
    "シトラス": 4,
    "シプレ&フゼア": 5,
  },  _prefix: true

  enum main_spice_id: {
    "---": 0,
  },  _prefix: true

  enum smell_impression_id: {
    "---": 0,
    "エレガント": 1,
    "キュート": 2,
    "セクシー": 3,
    "スマート": 4,
    "ワイルド": 5,
    "クール": 6,
  },  _prefix: true

  enum use_scene_id: {
    "---": 0,
    "オフィス": 1,
    "デート": 2,
    "デイリー": 3,
    "パーティー": 4,
    "リラックス": 5,
  },  _prefix: true
end
