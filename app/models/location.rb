class Location < ApplicationRecord
    has_many :walls
    has_many :artists, through: :walls
end
