class Location < ApplicationRecord
    validates_presence_of :city, :country, :continent
    validates :city, :country, :continent, length: { in: 2..20 }
    has_many :walls
    has_many :artists, through: :walls

    #E.g. using countries GEM: 
        # query = 'united states'
        # try = ISO3166::Country.find_country_by_name(query)
    #if not nil:
        # country = try.name
        # continent = try.continent
end
