class RemoveImageUrlFromTribes < ActiveRecord::Migration[6.0]
  def change

    remove_column :tribes, :image_url, :string
  end
end
