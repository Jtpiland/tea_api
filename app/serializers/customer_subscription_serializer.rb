class CustomerSubscriptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :customer_id, :subscription_id, :status, :subscription
end
