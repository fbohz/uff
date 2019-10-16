class Location < ApplicationRecord
    validates_presence_of :city, :country
    validates :city, :country, length: { in: 2..35 }
    has_many :walls
    has_many :artists, through: :walls

end
