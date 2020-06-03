class AddFoundDateToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :found_date, :date
  end
end
