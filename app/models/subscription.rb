class Subscription < ApplicationRecord
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions
  has_many :tea_subscriptions
  has_many :teas, through: :tea_subscriptions

  enum status: [:available, :out_of_stock]
  enum frequency: [:weekly, :monthly, :yearly]

  validates :title, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :frequency, presence: true
end
