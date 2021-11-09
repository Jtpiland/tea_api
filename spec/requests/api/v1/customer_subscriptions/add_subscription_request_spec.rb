require 'rails_helper'

RSpec.describe 'Add subscription to customer request' do
  describe 'POST /api/v1/customer_subscriptions' do
    it 'can create on the customer subscription table' do
      customer = Customer.create(first_name: 'John', last_name: 'Appleseed', email: 'john@apple.com', address: '123 St. Big Apple, NY')
      subscription = Subscription.create(title: '2 Teas', price: '$30', status: 0, frequency: 1)

      post "/api/v1/customers/#{customer.id}/customer_subscriptions", params: { customer_id: customer.id, subscription_id: subscription.id }

      expect(response.status).to eq(200)
      expect(CustomerSubscription.count).to eq(1)
      expect(customer.subscriptions.first.title).to eq('2 Teas')
      expect(customer.subscriptions.first.price).to eq('$30')
      expect(customer.subscriptions.first.status).to eq('subscribed')
      expect(customer.subscriptions.first.frequency).to eq('monthly')
    end
  end
end
