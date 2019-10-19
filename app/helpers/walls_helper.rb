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

    def link_artist(wall)
        html = ''
        if wall.artists.blank?
            content_tag(:div, "Wall Unclaimed. Edit Wall to Add Artist")
        else 
            wall.artists.each do |a|
                html << link_to(a.name, artist_path(a)) 
                html << "</br>"
            end
        end
        html.html_safe
    end 

    def tag_list
    end
end
