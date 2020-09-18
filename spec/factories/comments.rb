FactoryBot.define do
  factory :comment do
    content { "TestContent" }
    user
    post
  end
end
