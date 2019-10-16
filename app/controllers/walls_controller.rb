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
        # raise @wall.inspect
    end 

    def create
        # raise wall_params.inspect
        @errors = []
        date = get_date
        @wall = Wall.new(active: true, date_done: date, description: wall_params["description"], address: wall_params["address"])

        @wall.location = check_location
        @wall.add_errors("Location not found, if you meant to add new location click link below") unless @wall.location
        
        @wall.artists_attributes=wall_params["artists_attributes"]
        @wall.tags_attributes=wall_params["tags_attributes"]


        binding.pry
        if @wall.save
            redirect_to wall_path(@wall)
        elsif !@wall.save && @wall.found_errors
            @wall.found_errors.each do |e|
                self.errors[:base] << e
            end
            render :new
        else 
            render :new
        end

        #remember set 'active' attribute to TRUE.

        # wall_params[:wall]["artists_attributes"]
        # self.errors[:base] << "Artist not found, if you meant to add new artist click link below"
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
        Location.find_by(city: wall_params["location_name"])
    end

    def get_date
       year = wall_params["date_done"].to_i
       Date.new(year) unless year == 0
    end
end
