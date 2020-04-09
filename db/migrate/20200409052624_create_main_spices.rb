class CreateMainSpices < ActiveRecord::Migration[5.2]
  def change
    create_table :main_spices do |t|
      t.string :name
      t.timestamps
    end
  end
end
