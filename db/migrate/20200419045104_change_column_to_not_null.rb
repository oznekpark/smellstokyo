class ChangeColumnToNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column :comments, :text,:text, null: false
  end

  def down
    change_column :comments, :text,:text
  end
end
