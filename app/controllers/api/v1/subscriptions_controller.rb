class Api::V1::SubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    customer_subscriptions = customer.customer_subscriptions

    render json: CustomerSubscriptionSerializer.new(customer_subscriptions)
  end
end
