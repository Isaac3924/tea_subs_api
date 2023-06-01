class Customer < ApplicationRecord
  validates :first_name, :last_name, :email, :address, presence: true
  has_many :subscriptions
end