class AddOriginalDateToRides < ActiveRecord::Migration[6.0]
  def change
    add_column :rides, :original_date, :date
  end
end
