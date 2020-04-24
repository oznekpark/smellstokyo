class AddNamejapToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :namejap, :string, null: false
  end
end
