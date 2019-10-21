class Wall < ApplicationRecord
  validates_presence_of :description
  validates :description, length: { maximum: 500 }
  belongs_to :location
  has_many :artist_walls, dependent: :destroy
  has_many :artists, through: :artist_walls
  has_many :tags, dependent: :destroy
  has_many :bravos, dependent: :destroy
  accepts_nested_attributes_for :artist_walls
  has_many_attached :images
  validates_length_of :artists, maximum: 4, message: "limit reached! Too many artists for a single wall (limit 4)"
  validates_length_of :tags, maximum: 4, message: "only 4 tags per wall are allowed."
  validates_length_of :images, maximum: 4, message: "limit reached! Please upload up to four (4) images only."

  def self.latest_walls
    order(created_at: :desc).limit(4)
  end 

  def self.old_walls
    #needs some refactor, not used at this point though.
    where("created_at <?", Time.zone.today.beginning_of_day)
  end 

  def add_errors(error)
    @found_errors ||= []
    @found_errors << error
  end

  def found_errors
    @found_errors 
  end

  def artists_attributes=(artists_attributes)
      self.artists.clear

      artists_attributes.values.each do |artist_attribute|
        artist = Artist.find_by(name: artist_attribute["name"])
        if artist
          self.artists << artist 
        else
          self.add_errors("Artist named '#{artist_attribute["name"]}' not found! If you meant to add new artist click Add New Artist below")
        end 
      end
  end

  def tags_attributes=(tags_attributes)
    self.tags.clear
    tags_attributes.values.each do |tag_attribute|
      if tag_attribute["name"]
        tag = Tag.find_or_initialize_by(name: tag_attribute["name"].downcase.strip.gsub(" ", ""))
        self.tags << tag
      end 
    end
  end


  def bravo_count
  end 

  def location_name=(name)
    self.location = Location.find_by(name: name)
  end

  def location_name
    self.location ? self.location.city : nil
  end 

  def check_location(name)
    location_find = Location.find_by(city: name)

    if location_find
      self.location = location_find
    else
      self.add_errors("Location '#{name}' not found! If you meant to add new location click Add New below")
    end

  end

end
