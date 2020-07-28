FactoryBot.define do
  factory :post do

    prefecture = Prefecture.create(prefecture: "北海道")
    category = Category.create(category: "動物")

    found_animal { "クマ" }
    prefecture { prefecture }
    category { category }
    found_date { Time.now }

    association :user

  end
end
