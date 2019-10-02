class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :bio
      t.string :hometown
      t.string :instagram
      t.string :website

      t.timestamps
    end
  end
end
