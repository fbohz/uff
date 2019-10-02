class CreateBravos < ActiveRecord::Migration[6.0]
  def change
    create_table :bravos do |t|
      t.integer :bravo_count
      t.belongs_to :wall, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
