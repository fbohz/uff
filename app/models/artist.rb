class Artist < ApplicationRecord
    has_many :artist_walls, dependent: :destroy
    has_many :walls, through: :artist_walls
    has_many :locations, through: :walls
    has_many :bravos, through: :walls
    has_many :tags, through: :walls
    accepts_nested_attributes_for :walls
    has_one_attached :image

end
