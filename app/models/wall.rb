class Wall < ApplicationRecord
  validates_presence_of :description
  belongs_to :location
  has_many :artist_walls
  has_many :artists, through: :artist_walls
  has_many :tags
  has_many :bravos
  accepts_nested_attributes_for :artists
  has_many_attached :images

  #custom nested build try. Do binding.pry to see what is self.
  # def artist_attributes=(artist_attr)
  #   self.artist = Artist.find_or_create_by(name: artist_attr[:name])
  #   self.artist.update(artist_attr)
  # end

  before_save :find_or_create_artist

  def bravo_count

  end 

  private

  def find_or_create_artist
    self.artists = self.artists.collect do |artist|
      Artist.find_or_create_by(name: artist.name)
    end
  end



end
