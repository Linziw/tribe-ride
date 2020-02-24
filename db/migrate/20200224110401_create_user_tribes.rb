class CreateUserTribes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tribes do |t|
      t.integer :user_id
      t.integer :tribe_id

      t.timestamps
    end
  end
end
