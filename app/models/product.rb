class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :sex
  belongs_to :season, optional: true
  belongs_to :smell_type
  belongs_to :main_spice
  belongs_to :smell_impression
  belongs_to :use_scene
  has_many :comments, dependent: :destroy
  has_many :order_details
  has_many :orders, through: :order_details
  has_many :line_items, dependent: :destroy
  before_destroy :ensure_not_referenced_by_any_line_item

  #cart機能
  before_destroy :ensure_not_referenced_by_any_line_item

  #ヘッダー検索
  def self.search(search)
    if search
      Product.where("(name LIKE ?) OR (namejap LIKE ?)", "%#{search}%", "%#{search}%")
    else
      Product.all
    end
  end

  #プルダウン検索
  def self.choose(brand, sex, smell_type, main_spice, smell_impression, use_scene)
    Product.where("brand_id = ? or sex_id = ? or smell_type_id = ? or main_spice_id = ? or smell_impression_id = ? or use_scene_id = ?", brand, sex, smell_type, main_spice, smell_impression, use_scene)
  end

  private
  def ensure_not_referenced_by_any_line_item
    # 関連する品目が空でないか検証
    if line_items.empty?
      return true
    else
      errors.add(:base, "品目が存在します")
      return false
    end
  end
end
