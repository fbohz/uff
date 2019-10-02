class Wall < ApplicationRecord
  belongs_to :location
  has_many :artist_walls
  has_many :artists, through: :artist_walls
  has_many :tags
  has_many :bravos
  # accepts_nested_attributes_for 
end
