class Subscription < ApplicationRecord
  validates :title, :price, :status, :frequency, presence: true
  belongs_to :customer
  belongs_to :tea
end