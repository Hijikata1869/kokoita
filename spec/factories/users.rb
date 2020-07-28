FactoryBot.define do
  factory :user do
    
    nickname { "Aaron Sumner" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "dottle-nouveau-pavilion-tights-furze" }

    trait :with_posts do
      after(:create) { |user| create_list(:post, 5, user: user) }
    end

  end
end
