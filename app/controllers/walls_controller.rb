class WallsController < ApplicationController
    before_action :set_wall, only: [:show, :edit, :update, :destroy]
    before_action :update_artist_names_json, only: [:new, :edit] 
    before_action :get_date, only: [:create, :update]
    before_action :img_resize, only: [:create, :update]
    before_action :authenticate_user!, only: [:new, :edit]

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
        case 
        when @wall.found_errors
            @wall.found_errors.each do |e|
                @wall.errors[:base] << e
            end
            render :new
        when @wall.update(date_done: @date, description: wall_params["description"], address: wall_params["address"], artists_attributes: wall_params["artists_attributes"], tags_attributes: wall_params["tags_attributes"])
            if wall_params["images"].nil? 
                flash[:notice] = "Wall updated!"
                redirect_to @wall
            elsif wall_params["images"] && @wall.update(images: wall_params["images"]) 
                flash[:notice] = "Wall updated!"
                redirect_to @wall
            else 
                render :edit
            end
        else 
            render :edit
        end
    end 

    def destroy
        @wall.destroy
        flash[:notice] = "Wall deleted!"
        redirect_to root_path
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

    def img_resize
        if wall_params["images"]
            wall_params["images"].collect do |i|
                if i.tempfile.size > 300.kilobytes                     
                    i = MiniMagick::Image.new("#{i.tempfile.path}")
                    i.strip
                    i.resize "70%"
                end 
            end 
        end 
    end 
end
