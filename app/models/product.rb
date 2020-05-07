class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :sex
  belongs_to :season, optional: true
  belongs_to :smell_type
  belongs_to :main_spice
  belongs_to :smell_impression
  belongs_to :use_scene
  has_many :comments, dependent: :destroy
  has_many :line_items
  validates :name, :description, :image, presence: true

  def self.search(search)
    if search
      Product.where('name LIKE ?', "%#{search}%")
    else
      Product.all
    end
  end

  scope :get_brand_id, -> brand_id {where(brand_id: brand_id)}
  scope :get_sex_id, -> sex_id {where(sex_id: sex_id)}
  scope :get_smell_type_id, -> (smell_type_id) {where(smell_type_id: smell_type_id)}
  scope :get_main_spice_id, -> (main_spice_id) {where(main_spice_id: main_spice_id)}
  scope :get_smell_impression_id, -> (smell_impression_id) {where(smell_impression_id: smell_impression_id)}
  scope :get_use_scene_id, -> (use_scene_id) {where(use_scene_id: use_scene_id)}
end
