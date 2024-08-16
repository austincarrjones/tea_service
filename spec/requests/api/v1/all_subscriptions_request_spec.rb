require 'rails_helper'

describe "GET all customer subscriptions" do 
  it "can get all subscription records for a customer" do 
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
    expect(subscriptions.count).to eq(5)

    subscriptions.each do |subscription|
      expect(subscription[:attributes]).to have_key(:customer_id)
      expect(subscription[:attributes]).to have_key(:tea_id)
      expect(subscription[:attributes]).to have_key(:frequency)
      expect(subscription[:attributes]).to have_key(:price)
      expect(subscription[:attributes]).to have_key(:status)
    end
  end
end