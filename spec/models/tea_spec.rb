require 'rails_helper'

RSpec.describe Tea do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:temperature) }
    it { should validate_presence_of(:brew_time) }
  end

  describe 'relationships' do
    it { should have_many(:tea_subscriptions) }
    it { should have_many(:subscriptions).through(:tea_subscriptions) }
  end

  describe 'instantiation' do
    it 'exists has attributes' do
      tea = Tea.create(title: 'Green Tea', description: 'Tastes Green', temperature: '165F', brew_time: '3 Minutes')

      expect(tea).to be_a(Tea)
      expect(tea.title).to eq('Green Tea')
      expect(tea.description).to eq('Tastes Green')
      expect(tea.temperature).to eq('165F')
      expect(tea.brew_time).to eq('3 Minutes')
    end
  end
end
