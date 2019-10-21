class WallsController < ApplicationController
    before_action :set_wall, only: [:show, :edit, :update, :destroy]
    before_action :update_artist_names_json, only: [:new, :edit] 
    before_action :get_date, only: [:create, :update]

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
        @artist_wall = ArtistWall.find_by(wall_id: params[:id])
    end 

    def create
        @wall = Wall.new(active: true, date_done: @date, description: wall_params["description"], address: wall_params["address"], artists_attributes: wall_params["artists_attributes"], tags_attributes: wall_params["tags_attributes"], images: wall_params["images"])

        @wall.check_location(wall_params["location_name"])

        if @wall.found_errors
            @wall.found_errors.each do |e|
                @wall.errors[:base] << e
            end
            render :new
        elsif @wall.save
            flash[:notice] = "New Wall Successfuly Added!"
            redirect_to wall_path(@wall)
        else 
            render :new
        end
    end 

    def edit
    end 

    def update
        @wall.check_location(wall_params["location_name"])
        if @wall.found_errors
            @wall.found_errors.each do |e|
                @wall.errors[:base] << e
            end
            render :new
        elsif @wall.update(date_done: @date, description: wall_params["description"], address: wall_params["address"], artists_attributes: wall_params["artists_attributes"], tags_attributes: wall_params["tags_attributes"])
            @wall.update(images: wall_params["images"]) if wall_params["images"]
            flash[:notice] = "Wall updated!"
            redirect_to @wall
        else 
            render :edit
        end
    end 

    def destroy
        #MAKE SURE WALL IS DELETED FROM BOTH ARTIST AND WALL ITSELF!
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
            :location_name, 
            :artist_id,
            images: [], 
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

    def get_date
       get_data = wall_params["date_done"].to_i
       @date = Date.new(get_data) unless get_data == 0
    end
end
