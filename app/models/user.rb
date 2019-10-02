class User < ApplicationRecord
    has_many :bravos
    # has_many :walls, through :bravos
    has_one_attached :image
    
end
