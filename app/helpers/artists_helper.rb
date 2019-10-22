module ArtistsHelper
    def insert_wall_image_link(artist)
        html = ''
        wall = artist.walls.take
        if wall
            if wall.images.first.present?
                html <<  "<img src='https://storage.googleapis.com/rails_proj/#{wall.images.first.key.to_s}' alt='Wall image'>"
            end 
        else 
            html << "<img src='/img/wsoon.jpg' alt='Placeholder image'>"
        end

        html.html_safe
    end
end
