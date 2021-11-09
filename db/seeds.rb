# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'
require 'faker'

CustomerSubscription.destroy_all
TeaSubscription.destroy_all
Customer.destroy_all
Subscription.destroy_all
Tea.destroy_all

#create customers
10.times do
  FactoryBot.create :customer
end

#create subscriptions
5.times do
  FactoryBot.create :subscription
end

#create teas
10.times do
  FactoryBot.create :tea
end

TeaSubscription.create(tea: Tea.all[0], subscription: Subscription.all[0])
TeaSubscription.create(tea: Tea.all[1], subscription: Subscription.all[1])
TeaSubscription.create(tea: Tea.all[2], subscription: Subscription.all[2])
TeaSubscription.create(tea: Tea.all[3], subscription: Subscription.all[3])
TeaSubscription.create(tea: Tea.all[4], subscription: Subscription.all[4])

CustomerSubscription.create(customer: Customer.all[0], subscription: Subscription.all[0])
CustomerSubscription.create(customer: Customer.all[1], subscription: Subscription.all[1])
CustomerSubscription.create(customer: Customer.all[2], subscription: Subscription.all[2])
CustomerSubscription.create(customer: Customer.all[3], subscription: Subscription.all[3])
CustomerSubscription.create(customer: Customer.all[4], subscription: Subscription.all[4])
CustomerSubscription.create(customer: Customer.all[5], subscription: Subscription.all[0])
CustomerSubscription.create(customer: Customer.all[6], subscription: Subscription.all[1])
CustomerSubscription.create(customer: Customer.all[7], subscription: Subscription.all[2])
CustomerSubscription.create(customer: Customer.all[8], subscription: Subscription.all[3])
CustomerSubscription.create(customer: Customer.all[0], subscription: Subscription.all[4])
