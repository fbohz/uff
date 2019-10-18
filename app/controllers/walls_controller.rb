class WallsController < ApplicationController
    before_action :set_wall, only: [:show, :edit, :update, :destroy]
    before_action :update_artist_names_json, only: [:new, :edit] 

    def index
        case
        when params[:artist_id]
            @artist = Artist.find_by_id(params[:artist_id])
            if @artist
                @walls = @artist.walls
            else
                flash[:alert] = "Artist not found."
                redirect_to artists_path 
            end
        else
            @walls = Wall.all
        end
    end 

    def new
        case
        when params[:artist_id]
            @artist = Artist.find_by_id(params[:artist_id])
            if @artist
                @wall = @artist.walls.build 
                1.times{@wall.tags.build} 
            else
                flash[:alert] = "Artist not found."
                redirect_to artists_path 
            end
        else
            @wall = Wall.new                      
            1.times{@wall.tags.build} 
            1.times{@wall.artists.build} 
        end                        
    end

    def show
        # raise @wall.inspect
    end 

    def create
        @errors = []
        date = get_date
        @wall = Wall.new(active: true, date_done: date, description: wall_params["description"], address: wall_params["address"])

        @wall.location = check_location
        @wall.add_errors("Location '#{wall_params["location_name"]}' not found! If you meant to add new location click Add New below") unless @wall.location
        
        @wall.artists_attributes=wall_params["artists_attributes"]
        @wall.tags_attributes=wall_params["tags_attributes"]

        if @wall.save
            flash[:notice] = "New Wall Successfuly Added!"
            redirect_to wall_path(@wall)
        elsif !@wall.save && @wall.found_errors
            @wall.found_errors.each do |e|
                @wall.errors[:base] << e
            end
            render :new
        else 
            render :new
        end
    end 

    def edit
    end 

    def update
        # collaboration_details
        # ArtistWall.find_by(id: 
        flash[:notice] = "Wall updated!"
    end 

    def destroy
        flash[:notice] = "Wall deleted!"
        redirect_to root_path
    end


    def new_artist_partial
        respond_to do |format|
          format.js
        end
    end
    
    private

    def wall_params
        params.require(:wall).permit(
            :date_done, 
            :address, 
            :description, 
            :image, 
            :location_name, 
            :artist_id,
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
