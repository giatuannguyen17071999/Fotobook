class RemoveAlbumFromPhotos < ActiveRecord::Migration[6.0]
  def change
    change_table :photos do |t|
      t.remove :album_id
      t.references :user, null: false, foreign_key: true
    end
    change_column :photos, :mode, :integer, default: 1
    # remove_reference :photos, :album, index: true, foreign_key: true
    # add_reference :photos, :user, index: true, foreign_key: true

    change_column :users, :is_admin?, :boolean, default: false
    change_column :users, :status, :integer, default: 1

    change_column :albums, :mode, :integer, default: 1
  end
end
