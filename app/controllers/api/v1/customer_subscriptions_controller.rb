class Api::V1::CustomerSubscriptionsController < ApplicationController

  def create
    customer_subscription = CustomerSubscription.create(customer_subscription_params)
    subscription = Subscription.where('id = ?', params[:subscription_id])
    render json: SubscriptionSerializer.new(subscription)
  end

  def update
    customer_subscription = CustomerSubscription.where('customer_id = ? AND subscription_id = ?', params[:customer_id], params[:subscription_id])
    customer_subscription.update(customer_subscription_params)

    render json: CustomerSubscriptionSerializer.new(customer_subscription)
  end


  private

  def customer_subscription_params
    params.permit(:customer_id, :subscription_id, :status)
  end
end
