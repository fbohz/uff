module LocationsHelper
    def walls_count_helper(l)
        html = ''
        count = l.city_walls_count(l.city)
        if l.city_walls_count(l.city) == 0
            html << "So empty :( <br>"
            html << link_to("Add New Wall", new_wall_path)
            html << " and select <b> #{l.city} </b>."
        else
            html << "#{count} Wall(s) Added"
        end     
        html.html_safe    
    end
end
