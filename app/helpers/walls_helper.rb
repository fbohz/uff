module WallsHelper
    def index_title(artist =nil)
        if artist && artist.walls.present?
            content_tag(:h1, "#{artist.name} Walls:")
        else
            content_tag(:h1, "Latest Walls" )
        end 
    end
end
