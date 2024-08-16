class AddPriceToSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_column :subscriptions, :price, :float
  end
end
