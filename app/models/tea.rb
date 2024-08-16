class Tea < ApplicationRecord
  has_many :subscriptions

  validates :title, presence: true
  validates :price, numericality: { greater_than: 0 }
end