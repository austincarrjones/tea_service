FactoryBot.define do
  factory :tea do
    title { Faker::Tea.type }
    description { Faker::Lorem.sentence }
    temperature { "#{Faker::Number.between(from: 60, to: 100)}°C" }
    brew_time { "#{Faker::Number.between(from: 1, to: 10)} minutes" }
    price { Faker::Commerce.price(range: 1.0..20.0) }
  end
end