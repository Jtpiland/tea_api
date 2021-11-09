require 'rails_helper'

RSpec.describe 'New Customer Endpoint' do
  describe 'POST request' do
    it 'can create a new user and store their attributes' do
      post "/api/v1/customers", params: {
        first_name: 'John',
        last_name: 'Appleseed',
        email: 'John@apple.com',
        address: '123 St. The Big Apple, NY'
      }

      new_customer = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(Customer.last.first_name).to eq('John')
      expect(Customer.last.last_name).to eq('Appleseed')
      expect(Customer.last.email).to eq('John@apple.com')
      expect(Customer.last.address).to eq('123 St. The Big Apple, NY')
      expect(Customer.count).to eq(1)

      expect(new_customer).to have_key(:data)
      expect(new_customer[:data]).to have_key(:id)
      expect(new_customer[:data]).to have_key(:type)
      expect(new_customer[:data][:type]).to eq('customer')
      expect(new_customer[:data]).to have_key(:attributes)
      expect(new_customer[:data][:attributes]).to be_a(Hash)
      expect(new_customer[:data][:attributes]).to have_key(:first_name)
      expect(new_customer[:data][:attributes]).to have_key(:last_name)
      expect(new_customer[:data][:attributes]).to have_key(:email)
      expect(new_customer[:data][:attributes]).to have_key(:address)
    end
  end
end
