class RemoveTrideIdFromRide < ActiveRecord::Migration[6.0]
  def change

    remove_column :rides, :tride_id, :integer
  end
end
