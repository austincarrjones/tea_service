class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea
  
  before_save :set_status
  before_save :calculate_price

  validates :title, :frequency, presence: true

  enum frequency: { weekly: 0, monthly: 1, quarterly: 2 }


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

  def set_status
    self.status ||= "active"
  end

end