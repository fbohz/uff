require 'uri'

class Artist < ApplicationRecord



    validates_presence_of :name, :hometown, :bio
    validates_uniqueness_of :name
    validates :name, :hometown, length: { in: 2..20 }
    validates :bio, length: { maximum: 500 }
    validates :website, :instagram, url: { public_suffix: true, allow_nil: true }
    has_many :artist_walls, dependent: :destroy
    has_many :walls, through: :artist_walls
    has_many :locations, through: :walls
    has_many :bravos, through: :walls
    has_many :tags, through: :walls
    accepts_nested_attributes_for :walls
    has_one_attached :image

end


