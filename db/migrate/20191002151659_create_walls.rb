class CreateWalls < ActiveRecord::Migration[6.0]
  def change
    create_table :walls do |t|
      t.boolean :active
      t.date :date_done
      t.text :description
      t.string :address
      t.belongs_to :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
