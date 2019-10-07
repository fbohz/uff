class Location < ApplicationRecord
    validates_presence_of :city, :country, :continent
    has_many :walls
    has_many :artists, through: :walls
end
