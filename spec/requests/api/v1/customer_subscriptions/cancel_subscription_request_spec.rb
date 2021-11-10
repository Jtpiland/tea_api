require 'rails_helper'

RSpec.describe 'Cancel subsciption to customer request' do
  describe 'PATCH /api/v1/customers/:customer_id/customer_subsciptions' do
    it 'can cancel on the customer result' do
      customer = Customer.create(first_name: 'John', last_name: 'Appleseed', email: 'john@apple.com', address: '123 St. Big Apple, NY')
      result = Subscription.create(title: '2 Teas', price: '$30', status: 0, frequency: 1)

      customer_subscription = CustomerSubscription.create(customer_id: customer.id, subscription_id: result.id, status: 0)

      patch "/api/v1/customers/#{customer.id}/customer_subscriptions/#{customer_subscription.id}", params: { customer_id: customer.id, subscription_id: result.id, status: 'cancelled' }

      result = JSON.parse(response.body, symbolize_names: true)[:data][0]

      expect(response.status).to eq(200)
      expect(customer.subscriptions.count).to eq(1)
      expect(customer.customer_subscriptions.first.status).to eq('cancelled')
      expect(result).to have_key(:id)
      expect(result).to have_key(:type)
      expect(result).to have_key(:attributes)
      expect(result[:attributes]).to be_a(Hash)
      expect(result[:attributes]).to have_key(:customer_id)
      expect(result[:attributes]).to have_key(:subscription_id)
      expect(result[:attributes]).to have_key(:status)
      expect(result[:attributes]).to have_key(:subscription)
      expect(result[:attributes][:subscription]).to be_a(Hash)
      expect(result[:attributes][:subscription]).to have_key(:id)
      expect(result[:attributes][:subscription]).to have_key(:title)
      expect(result[:attributes][:subscription]).to have_key(:price)
      expect(result[:attributes][:subscription]).to have_key(:status)
      expect(result[:attributes][:subscription]).to have_key(:frequency)
    end
  end
end
