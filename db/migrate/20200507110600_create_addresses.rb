class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :destination_first_name, null: false
      t.string :destination_family_name, null: false
      t.string :destination_first_name_kana, null: false
      t.string :destination_family_name_kana, null: false
      t.integer :postcode, null: false
      t.integer :prefecture_code, null: false
      t.string :address_city, null: false
      t.string :address_street, null: false
      t.string :address_building
      t.integer :phone_number, unique: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
