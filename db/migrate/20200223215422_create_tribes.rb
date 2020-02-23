class CreateTribes < ActiveRecord::Migration[6.0]
  def change
    create_table :tribes do |t|
      t.string :name
      t.string :image_url
      t.string :url

      t.timestamps
    end
  end
end
