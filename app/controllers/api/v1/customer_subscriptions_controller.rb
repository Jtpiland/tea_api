class Api::V1::CustomerSubscriptionsController < ApplicationController

  def create
    customer_subscription = CustomerSubscription.create(customer_subscription_params)
    render status: 200
  end

  private

  def customer_subscription_params
    params.permit(:customer_id, :subscription_id)
  end
end
