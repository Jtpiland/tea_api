class Api::V1::CustomersController < ApplicationController

  def create
    customer = Customer.create(customer_params)
    render json: CustomerSerializer.new(customer)
  end

  def destroy
  end

  def show
  end

  private

  def customer_params
    params.permit(:first_name, :last_name, :email, :address)
  end


end
