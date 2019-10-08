class ArtistWall < ApplicationRecord
  validates :collaboration_details, length: { maximum: 50 }
  belongs_to :artist
  belongs_to :wall
  
  def artists_involved
    
  end
end
