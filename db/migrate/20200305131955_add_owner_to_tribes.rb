class AddOwnerToTribes < ActiveRecord::Migration[6.0]
  def change
    add_column :tribes, :owner_id, :integer
  end
end
