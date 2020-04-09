class CreateSmellImpressions < ActiveRecord::Migration[5.2]
  def change
    create_table :smell_impressions do |t|
      t.string :name
      t.timestamps
    end
  end
end
