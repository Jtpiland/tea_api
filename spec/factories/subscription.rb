FactoryBot.define do
  factory :subscription do
    title { Faker::Tea.type }
    price { 15 }
    status { 0 }
    frequency { 0 }
  end
end
