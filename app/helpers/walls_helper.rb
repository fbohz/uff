module WallsHelper
    def index_title(artist =nil)
        html = ''
        if artist 
          html <<  "#{artist.name} Walls:"
        else
          html <<  "Latest Walls" 
        end 
        html.html_safe
    end

    def new_wall_title(artist=nil)
        if artist
            "New Wall for #{artist.name}"
          else
            "New Wall"
         end
    end

    def add_contr_details(wall)
        html = ''
        colab_details = ArtistWall.find_by(wall_id: wall.id).collaboration_details
        if wall.artists.length > 1 && !colab_details
            html << content_tag(:button, "+ Edit Contribution Info", class: "addContr button is-small is-primary is-inverted")
        elsif colab_details
            html << "<h6 class='title is-6'> Collaboration Details: </h6>"
            html << "<div id='colabDet'>#{colab_details} </div>"
            html << "<button class='addContr button is-small is-primary is-inverted'>+ Edit Contribution Info</button>"

        end
        html.html_safe
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
