module LocationsHelper
    def walls_count_helper(l)
        html = ''
        count = l.city_walls_count(l.city)
        if l.city_walls_count(l.city) == 0
            html << "So empty :( <br>"
            html << link_to("Add New Wall", new_wall_path)
            html << " and select <b> #{l.city} </b>."
        else
            html << "#{count} Wall(s) Added <br>"
            html << link_to("See Walls", locations_walls_path(l), class: "button is-small is-primary")
        end     
        html.html_safe    
    end

    def delete_helper(l)
        html = ''
        if l.walls.length == 0
            html << button_to('Delete', location_path(l), method: :delete, data: { confirm: "This will delete #{l.city} you sure?"}, class: 'button is-small is-danger')
        end
        html.html_safe
    end

    def location_edit_link(l)
        html = ''
        if user_signed_in?
            html = " | "
            html << link_to("edit", edit_location_path(l))
        end 
        html.html_safe
    end
end
