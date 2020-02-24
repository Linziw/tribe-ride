class CreateRides < ActiveRecord::Migration[6.0]
  def change
    create_table :rides do |t|
      t.integer :tride_id
      t.string :instructor
      t.date :date
      t.time :time
      t.string :format
      t.integer :duration
      t.belongs_to :tribe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
