class CreatePlaylistComments < ActiveRecord::Migration[5.2]
  def change
    create_table :playlist_comments do |t|
      t.integer :user_id
      t.text :comment
      t.integer :playlist_id

      t.timestamps
    end
  end
end
