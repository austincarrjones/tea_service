FactoryBot.define do
  factory :subscription do
    title { Faker::Lorem.sentence }
    frequency { ["weekly", "monthly", "quarterly"].sample }
    price { Faker::Commerce.price(range: 1.0..20.0) }
    status { "active" }

    association :customer
    association :tea
  end
end