FactoryGirl.define do
  factory :post, class: Post do
    category { Post.categories.keys.sample }
    content  { Faker::Lorem.sentence }
  end
end
