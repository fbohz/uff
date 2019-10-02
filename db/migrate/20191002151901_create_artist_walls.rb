class CreateArtistWalls < ActiveRecord::Migration[6.0]
  def change
    create_table :artist_walls do |t|
      t.text :contribution_details
      t.belongs_to :artist, null: false, foreign_key: true
      t.belongs_to :wall, null: false, foreign_key: true

      t.timestamps
    end
  end
end
