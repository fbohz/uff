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
        # @tag = Tag.find_or_create_by(check_params)
        @location = Location.find_by(wall_params[:wall]["location_name"])
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

end
