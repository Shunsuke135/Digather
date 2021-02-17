class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.string :name
      t.text :information
      t.integer :user_id
      t.integer :genre_id
      t.timestamps
    end
  end
end
