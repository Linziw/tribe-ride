class CreateUserRides < ActiveRecord::Migration[6.0]
  def change
    create_table :user_rides do |t|
      t.integer :user_id
      t.integer :ride_id
      t.string :milestone
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :ride, null: false, foreign_key: true

      t.timestamps
    end
  end
end
