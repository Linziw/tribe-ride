class AddOriginalTimeToRides < ActiveRecord::Migration[6.0]
  def change
    add_column :rides, :original_time, :time
  end
end
