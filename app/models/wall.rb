class Wall < ApplicationRecord
  validates_presence_of :description
  validates :description, length: { maximum: 500 }
  belongs_to :location
  has_many :artist_walls
  has_many :artists, through: :artist_walls
  has_many :tags
  has_many :bravos
  accepts_nested_attributes_for :artist_walls
  has_many_attached :images

  #custom nested build try. Do binding.pry to see what is self.
  # def artists_attributes=(artist_name)
  #   self.artist = Artist.find_by(artist_name)
  #   self.artist.update(artist_attr)
  # end

def artists_attributes=(artists_attributes)
    artists_attributes.values.each do |artist_attribute|
      artist = Artist.find_by(artist_attribute["name"])
      if artist
        self.artists << artist
      else
        self.errors[:base] << "Artist not found, if you meant to add new artist click link below"
      end 
    end
end

def tags_attributes=(tags_attributes)
  tags_attributes.values.each do |tag_attribute|
    tag = Tag.find_or_initialize_by(tag_attribute["name"])
    self.tags << tag
  end
end



  # before_save :find_or_create_artist, :find_or_create_tag

  def bravo_count
  end 

  def location_name=(name)
    self.location = Location.find_by(name: name)
  end

  def location_name
    self.location ? self.location.city : nil
  end 

  # def artists_names=(name)
  #   self.artists << name
  #   binding.pry
  # end

  # def location_name
  #   self.location ? self.location.city : nil
  # end 

  private

  # def find_or_create_artist
  #   self.artists = self.artists.collect do |artist|
  #     Artist.find_or_create_by(name: artist.name)
  #   end
  # end

  # def find_or_create_tag
  #   self.tags = self.tags.collect do |tag|
  #     Tag.find_or_create_by(name: tag.name)
  #   end
  # end    

end
