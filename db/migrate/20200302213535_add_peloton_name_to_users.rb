class AddPelotonNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :peloton_name, :string
  end
end
