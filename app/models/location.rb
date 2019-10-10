class Location < ApplicationRecord
    validates_presence_of :city, :country
    validates :city, :country, length: { in: 2..20 }
    has_many :walls
    has_many :artists, through: :walls

end
