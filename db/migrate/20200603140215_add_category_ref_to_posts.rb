class AddCategoryRefToPosts < ActiveRecord::Migration[5.2]
  def chenge
    add_reference :posts, :category, foreign_key: true
  end
end
