require 'rails_helper'

describe "Cancel a Subscription" do 
  it "can cancel a new subscription record" do 
    customer_1 = create(:customer)
    5.times do
      create(:tea)
    end
    5.times do
      create(:subscription)
    end
    
    get "/api/v1/customers/#{customer_1.id}/subscriptions"
                
    expect(response).to be_successful

    subscriptions = JSON.parse(response.body, symbolize_names: true)[:data]
    binding.pry
    expect(subscriptions.count).to eq(5)

    subscriptions.each do |subscription|
      expect(subscription).to have_key(:customer_id)
      expect(subscription).to have_key(:frequency)
    end
  end
end