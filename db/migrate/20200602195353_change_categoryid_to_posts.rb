class ChangeCategoryidToPosts < ActiveRecord::Migration[5.2]
  def down
    change_column :posts, :category_id, :bigint
  end
end
