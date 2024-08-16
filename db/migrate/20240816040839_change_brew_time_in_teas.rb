class ChangeBrewTimeInTeas < ActiveRecord::Migration[7.1]
  def change
    change_column :teas, :brew_time, :string
  end
end
