module HomeHelper
    def home_tag_list(wall)
        tags = wall.tags.limit(2)
    end 
end
