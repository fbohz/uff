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
            html << "Wall Unclaimed. Edit Wall to Add Artist"
        else 
            wall.artists.each do |a|
                html << link_to(a.name, artist_path(a)) 
                html << "</br>"
            end
        end
        html.html_safe
    end 

    def tag_list(wall)
        html = ''
        if wall.tags.blank?
            html << "No Tags. Edit Wall to Add Tags"
        else 
            wall.tags.each do |t|
                html << "##{t.name}"
                html << "</br>"
            end
        end
        html.html_safe
    end 
end
