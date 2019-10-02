class ArtistWall < ApplicationRecord
  belongs_to :artist
  belongs_to :wall
  
  def artists_involved
    
  end
end
