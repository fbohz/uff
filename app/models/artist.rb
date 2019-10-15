require 'uri'
require 'json'

class Artist < ApplicationRecord
    validates_presence_of :name, :hometown, :bio
    validates_uniqueness_of :name
    validates :name, :hometown, length: { in: 2..20 }
    validates :bio, length: { maximum: 500 }
    validates :website, :instagram, url: { public_suffix: true, allow_nil: true, allow_blank: true }
    has_many :artist_walls, dependent: :destroy
    has_many :walls, through: :artist_walls
    has_many :locations, through: :walls
    has_many :bravos, through: :walls
    has_many :tags, through: :walls
    accepts_nested_attributes_for :walls, :locations
    has_one_attached :image

    def self.get_artist_names
        path = "./public/static.json"
        File.delete(path) if File.exist?(path)
        File.new(path, "w+")
        
        hash = {}
        # hash = JSON.load(File.read(path))
        self.all.each do |a|
            hash["data"] ||= []
            hash["data"] << { "name" => a.name }
        end
        # binding.pry
        File.write(path, JSON.dump(hash))

    end

    def artist_name
        self.name
    end
    

end


