class Location < ApplicationRecord
    validates_presence_of :city, :country, :continent
    validates :city, :country, :continent, length: { in: 2..20 }
    has_many :walls
    has_many :artists, through: :walls

    #NOTE
    #maybe use gem to validate city input???
end
