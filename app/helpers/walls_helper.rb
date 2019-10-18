module WallsHelper
    def index_title(artist =nil)
        if artist 
            content_tag(:h1, "#{artist.name} Walls:")
        else
            content_tag(:h1, "Latest Walls" )
        end 
    end

    def new_wall_title(artist=nil)
        if artist
            "New Wall for #{artist.name}"
          else
            "New Wall"
         end
    end

    def add_contr_details(wall)
        if wall.artists.length > 1
            content_tag(:button, "+ Artists Contribution Info", class: "addContr button is-small is-primary is-inverted")
        end
    end
end
