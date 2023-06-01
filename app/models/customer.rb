class Customer < ApplicationRecord
  validates :first_name, :last_name, :email, :address, presence: true
  has_and_belongs_to_many :subscriptions
end