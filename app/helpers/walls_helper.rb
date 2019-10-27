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
        if wall.artists.present?
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
                html << "<a> ##{t.name} </a>"
                html << "</br>"
            end
        end
        html.html_safe
    end 


    def insert_image_link(image)
        html = ''
        if image.present?
            html <<  "<img src='https://storage.googleapis.com/rails_proj/#{image.key.to_s}' alt='Wall image'>"
        else 
            html << "<img src='/img/wsoon.jpg' alt='Placeholder image'>"
        end

        html.html_safe
    end

    def check_date(w)
        html = ''
        if w.date_done
            html << "| #{w.date_done.year}"
        end 
        html.html_safe
    end 

    def wall_show_buttons(w)
        html = ''
        if user_signed_in?
            html << button_to("Edit Wall", edit_wall_path(@wall), :method => "get", class: "button is-small is-primary is-inverted")
            html << button_to("Delete", w, method: :delete, data: { confirm: "This will delete this wall you sure?" }, class: "button is-small is-danger is-inverted")
        end 
        html.html_safe
    end

end
