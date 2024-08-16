require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:price) }
  end

  describe "relationships" do
    it { should have_many :subscriptions}
  end
end