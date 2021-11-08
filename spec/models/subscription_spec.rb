require 'rails_helper'

RSpec.describe Subscription do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:frequency) }
  end

  describe 'relationships' do
    it { should have_many(:customer_subscriptions) }
    it { should have_many(:customers).through(:customer_subscriptions) }
    it { should have_many(:tea_subscriptions) }
    it { should have_many(:teas).through(:tea_subscriptions) }
  end

  describe 'instatniation' do
    it 'exists and has attributes' do
      subscription = Subscription.create(title: '2 Teas', price: '$30', status: 'subscribed', frequency: 'once a month')

      expect(subscription).to be_a(Subscription)
      expect(subscription.title).to eq('2 Teas')
      expect(subscription.price).to eq('$30')
      expect(subscription.status).to eq('subscribed')
      expect(subscription.frequency).to eq('once a month')
    end
  end
end
