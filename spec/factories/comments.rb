FactoryBot.define do
  factory :comment do
    content { 'TestContent' }
    association :post
    user { post.user }
  end
end
