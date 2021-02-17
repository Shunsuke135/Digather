class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :tune
      t.text :detail
      t.integer :playlist_id

      t.timestamps
    end
  end
end
