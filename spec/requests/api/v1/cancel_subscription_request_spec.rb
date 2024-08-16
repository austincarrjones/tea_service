require 'rails_helper'

describe "Create a Subscription" do 
  it "can create a new subscription record" do 
    customer_1 = Customer.create!(first_name: "Bilbo", 
                                  last_name: "Baggins", 
                                  email: "precious@example.com", 
                                  street_address: "123 Bagend St",
                                  city: "Shire",
                                  state: "ME",
                                  postal_code: "80424",
                                  country: "UK")
    tea_1 = Tea.create!(title: "Sleepytime Tea", 
                        description: "Relaxing", 
                        temperature: "80°C", 
                        brew_time: "3 minutes", 
                        price: 5.00)
    subscription_params = ({
                            customer_id: customer_1.id,
                            tea_id: tea_1.id,
                            title: "Wind Down Tea Subscription",
                            frequency: "monthly"
                          })
    cancel_params = ({status: "cancelled"})
    
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/subscriptions", headers: headers, params: JSON.generate(subscription_params)
    created_subscription = Subscription.last

    expect(response).to be_successful
    expect(created_subscription.status).to eq("active")
    
    patch "/api/v1/subscriptions/#{created_subscription.id}", headers: headers, params: JSON.generate(cancel_params)

    expect(response).to be_successful
    expect(created_subscription.status).to eq("cancelled")
  end
end