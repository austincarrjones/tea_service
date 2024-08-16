require 'factory_bot_rails'

5.times do
  FactoryBot.create(:tea)
end
5.times do
  FactoryBot.create(:customer)
end
10.times do
  FactoryBot.create(:subscription)
end

puts "Seed data created!"