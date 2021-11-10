require 'rails_helper'

RSpec.describe TeaSubscription do
  describe 'relationships' do
    it { should belong_to(:tea) }
    it { should belong_to(:subscription) }
  end

  describe 'instantiation' do
    it 'exists and has attributes' do
      tea = Tea.create(title: 'Green Tea', description: 'Tastes Green', temperature: '165F', brew_time: '3 Minutes')
      subscription = Subscription.create(title: '2 Teas', price: '$30', status: 0, frequency: 1)

      option_1 = TeaSubscription.create(tea: tea, subscription: subscription)

      expect(option_1).to be_a(TeaSubscription)
    end
  end
end
