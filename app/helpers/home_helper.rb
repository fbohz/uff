module HomeHelper
    def home_tag_list(wall)
        tags = wall.tags.limit(2)
    end 

    def check_tags(model)
        html = ''
        if model.tags.present? 
            html << "<a> ##{model.tags.first.name} </a>"
        end
        html.html_safe
    end

    def wall_artists_card(wall)
        html = ''
        if wall.artists.length > 1
            html << "<b> Multiple Artist </b>Collaboration"
        else
            artist = wall.artists.first
            html << link_to(artist.name, artist_path(artist)) 
        end
        html.html_safe
    end 
end
