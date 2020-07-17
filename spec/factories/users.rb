FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
  end
end