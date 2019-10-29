module ArtistsHelper
    def insert_wall_image_link(artist)
        html = ''
        wall = artist.walls.take
        if wall && wall.images.first.present?
                html <<  "<img src='https://storage.googleapis.com/rails_proj/#{wall.images.first.key.to_s}' alt='Wall image'>"
        else 
            html << "<img src='/img/wsoon.jpg' alt='Placeholder image'>"
        end

        html.html_safe
    end

    def no_walls_check(a)
        html = ''
        if a && a.walls.empty?
            html << "<h4 class='title is-4'> Artist has now walls yet :( </h4> <br>"
            html <<  link_to("Add New #{a.name} Wall", new_artist_wall_path(a), class: "button is-danger")
            
        end
        html.html_safe
    end 

    def add_urls(a)
        html = ''
        website = link_to(a.website, a.website, target: :_blank)
        
        if a.instagram.present?
            instagram = link_to("@#{a.instagram_username(a.instagram)}", a.instagram, target: :_blank)
        end
    
        case
        when a.website.present? && a.instagram.present?
            html << instagram
            html << "<br>"
            html << "<small class='is-small'>#{website}</small> <br>"
        when a.instagram.present?
            html << instagram
        when a.website.present?
            html << "<small>#{website}</small> <br>"    
        end
        html.html_safe    
    end

    def add_instagram_only(a)
        html = ''
        if a.instagram.present?
            instagram = link_to("@#{a.instagram_username(a.instagram)}", a.instagram, target: :_blank)
            html << instagram
        end
        html.html_safe 
    end 

    def artist_show_buttons(a)
        html = ''
        if user_signed_in?
            html << button_to("Edit Artist", edit_artist_path(a), :method => "get", class: "button is-small is-primary is-inverted") 
            html << button_to("Delete", a, method: :delete, data: { confirm: "This will delete #{@artist.name} you sure?" }, class: "button is-small is-danger is-inverted")
        end 
        html.html_safe
    end 
end
