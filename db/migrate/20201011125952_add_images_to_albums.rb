class AddImagesToAlbums < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :images, :json
  end
end
