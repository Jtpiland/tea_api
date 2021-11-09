FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::ChuckNorris.fact }
    sequence(:temperature) { |n| n + 180 }
    sequence(:brew_time) { |n| n + 1 }
  end
end
