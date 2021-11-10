require 'rails_helper'

RSpec.describe 'Cancel subsciption to customer request' do
  describe 'PATCH /api/v1/customers/:customer_id/customer_subsciptions' do
    it 'can cancel on the customer subscription' do
      customer = Customer.create(first_name: 'John', last_name: 'Appleseed', email: 'john@apple.com', address: '123 St. Big Apple, NY')
      subscription = Subscription.create(title: '2 Teas', price: '$30', status: 0, frequency: 1)

      customer_subscription = CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription.id, status: 0)

      patch "/api/v1/customers/#{customer.id}/customer_subscriptions/#{customer_subscription.id}", params: { customer_id: customer.id, subscription_id: subscription.id, status: 'cancelled' }

      expect(response.status).to eq(200)
      expect(CustomerSubscription.count).to eq(1)
      expect(CustomerSubscription.first.status).to eq('cancelled')
    end
  end
end