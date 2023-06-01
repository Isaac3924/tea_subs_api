class Tea < ApplicationRecord
  validates :title, :description, :temperature, :brew_time, presence: true
  has_and_belongs_to_many :subscriptions
end