class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates :title, :price, :frequency, :status, presence: true
  validates :price, numericality: { greater_than: 0 }

  enum frequency: { weekly: 0, monthly: 1, quarterly: 2 }

  before_save :calculate_price

  private

  def calculate_price
    if frequency == 'weekly'
      self.price = tea.price * 4
    elsif frequency == 'monthly'
      self.price = tea.price
    elsif frequency == 'quarterly'
      self.price = tea.price * 3
    end
  end

end