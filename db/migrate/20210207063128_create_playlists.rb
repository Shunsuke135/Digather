class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :artist
      t.string :tune
      t.text :information
      t.integer :user_id

      t.timestamps
    end
  end
end
