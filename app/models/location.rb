class Location < ApplicationRecord
    validates_presence_of :city, :country
    validates :city, :country, length: { in: 2..35 }
    has_many :walls
    has_many :artists, through: :walls


    def city_walls_count(city_name)
        city = Location.find_by(city: city_name)
        city.walls.length
    end

end
