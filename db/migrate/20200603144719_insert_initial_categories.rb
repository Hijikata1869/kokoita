class InsertInitialCategories < ActiveRecord::Migration[5.2]
  def change
    categories = ["動物","魚","鳥","植物","虫","その他"]
    categories.each do |category|
      Category.create(category: category)
    end
  end
end
