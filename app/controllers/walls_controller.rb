class WallsController < ApplicationController
    before_action :set_wall, only: [:show, :edit, :update, :destroy]
    before_action :update_artist_names_json, only: [:new, :edit] 

    def index
    end 

    def new
        @wall = Wall.new
        1.times{@wall.tags.build} 
        1.times{@wall.artists.build} 
    end

    def show
        raise @wall.inspect
    end 

    def create
        raise wall_params.inspect

        new_params = wall_params[:wall]
        
        @wall = Wall.new(active: true, date_done: new_params["date_done"], description: new_params["description"], address: new_params["address"])
        
        self.check_location
        @wall.artists_attributes=new_params["artists_attributes"]
        @wall.tags_attributes=new_params["tags_attributes"]
        
        #remember set 'active' attribute to TRUE.

        
        # wall_params[:wall]["artists_attributes"]

        # ["artists_attributes", "collaboration_details", "location_name", "date_done", "address", "description", "tags_attributes"]
    end 

    def edit
    end 

    def update
    end 

    def destroy
    end


    def new_artist_partial
        respond_to do |format|
          format.js
        end
    end
    
    private

    def wall_params
        #NEED TO COMPLETE AND INCLUDE NESTED FORMS ATTRIBUTES TOO don't forget nested :id too, 
        params.require(:wall).permit(
            :date_done, 
            :address, 
            :description, 
            :image, 
            :location_name, 
            artist_walls_attributes: [:collaboration_details],
            tags_attributes: [:id, :name], 
            artists_attributes: [:id, :name, :bio, :hometown, :instagram, :website, :artist_name]
         ) 
    end 

    def set_wall
        @wall = Wall.find(params[:id])
    end

    def update_artist_names_json
        Artist.get_artist_names
    end 

    def check_location
        @location = Location.find_by(wall_params[:wall]["location_name"])

            if @location
                self.location = @location
            else
                self.errors[:base] << "Location not found, if you meant to add new location click link below"
         end
    end
end
