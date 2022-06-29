class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.integer :artist_id
      t.string :album_name
      t.integer :year

      t.timestamps
    end
  end
end
