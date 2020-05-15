class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.text :image
      t.integer :price
      t.integer :stock_quantity
      t.references :brand, foreign_key: true
      t.references :sex, foreign_key: true
      t.references :season, foreign_key: true
      t.references :smell_type, foreign_key: true
      t.references :main_spice, foreign_key: true
      t.references :smell_impression, foreign_key: true
      t.references :use_scene, foreign_key: true
      t.timestamps
    end
  end
end
