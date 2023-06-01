class Subscription < ApplicationRecord
  validates :title, :price, :status, :frequency, presence: true
  has_and_belongs_to_many :customers
  has_and_belongs_to_many :teas
end