class Customer < ApplicationRecord
  has_many :subscriptions

  validates :first_name, :last_name, :email, :street_address, :city, :state, :postal_code, :country, presence: true
  validates :email, uniqueness: true
end