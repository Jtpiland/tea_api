require 'rails_helper'

RSpec.describe Customer do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:address) }
  end

  describe 'relationships' do
    it { should have_many(:customer_subscriptions) }
    it { should have_many(:subscriptions).through(:customer_subscriptions) }
  end

  describe 'instantiation' do
    it 'exists and has attributes' do
      customer = Customer.create(first_name: 'John', last_name: 'Appleseed', email: 'john@apple.com', address: '123 St. Big Apple, NY')

      expect(customer).to be_a(Customer)
      expect(customer.first_name).to eq('John')
      expect(customer.last_name).to eq('Appleseed')
      expect(customer.email).to eq('john@apple.com')
      expect(customer.address).to eq('123 St. Big Apple, NY')
    end
  end
end
