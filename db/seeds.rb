Customer.create!(
  first_name: "Bilbo",
  last_name: "Baggins",
  email: "bilbo@example.com",
  street_address: "123 Bagend St",
  city: "Shire",
  state: "ME",
  postal_code: "80424",
  country: "UK"
)

# Create teas
Tea.create!(
  title: "Sleepytime Tea",
  description: "Relaxing herbal tea",
  temperature: "80°C",
  brew_time: "3 minutes",
  price: 5.00
)

# Create subscriptions
Subscription.create!(
  customer_id: Customer.first.id,
  tea_id: Tea.first.id,
  title: "Monthly Tea Subscription",
  frequency: "monthly"
)