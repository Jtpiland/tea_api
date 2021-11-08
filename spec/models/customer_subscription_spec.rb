require 'rails_helper'

RSpec.describe CustomerSubscription do
  describe 'relationships' do
    it { should belong_to(:customer) }
    it { should belong_to(:subscription) }
  end

  describe 'instantiation' do
    it 'exists and has attributes' do
      customer = Customer.create(first_name: 'John', last_name: 'Appleseed', email: 'john@apple.com', address: '123 St. Big Apple, NY')
      subscription = Subscription.create(title: '2 Teas', price: '$30', status: 'subscribed', frequency: 'once a month')

      subscription_1 = CustomerSubscription.create(customer: customer, subscription: subscription)

      expect(subscription_1).to be_a(CustomerSubscription)
    end

  end

end
