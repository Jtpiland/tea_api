require 'rails_helper'

RSpec.describe "Customer's Subscription Index" do
  describe 'GET /api/v1/customers/:customer_id/subscriptions' do
    it "can send index of a particular customer's subscriptions" do
      customer = Customer.create(first_name: 'John', last_name: 'Appleseed', email: 'john@apple.com', address: '123 St. Big Apple, NY')
      subscription = Subscription.create(title: '2 Teas', price: '$30', status: 0, frequency: 1)
      subscription_2 = Subscription.create(title: '2 Teas', price: '$30', status: 0, frequency: 2)
      subscription_3 = Subscription.create(title: '2 Teas', price: '$30', status: 0, frequency: 2)

      customer_subscription = CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription.id, status: 0)
      customer_subscription = CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription_2.id, status: 0)
      customer_subscription = CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription_3.id, status: 1)

      get "/api/v1/customers/#{customer.id}/subscriptions"

      subscription = JSON.parse(response.body, symbolize_names: true)[:data][0]

      expect(response.status).to eq(200)
      expect(subscription).to have_key(:id)
      expect(subscription).to have_key(:type)
      expect(subscription).to have_key(:attributes)
      expect(subscription[:attributes]).to be_a(Hash)
      expect(subscription[:attributes]).to have_key(:customer_id)
      expect(subscription[:attributes]).to have_key(:subscription_id)
      expect(subscription[:attributes]).to have_key(:status)
      expect(subscription[:attributes]).to have_key(:subscription)
      expect(subscription[:attributes][:subscription]).to be_a(Hash)
      expect(subscription[:attributes][:subscription]).to have_key(:id)
      expect(subscription[:attributes][:subscription]).to have_key(:title)
      expect(subscription[:attributes][:subscription]).to have_key(:price)
      expect(subscription[:attributes][:subscription]).to have_key(:status)
      expect(subscription[:attributes][:subscription]).to have_key(:frequency)
    end
  end
end
