FactoryBot.define do
  factory :post do
    found_animal { 'クマ' }
    found_date { Time.now }
    prefecture
    category
    association :user
  end
end
