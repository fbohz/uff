class WallsController < ApplicationController
    before_action :set_wall, only: [:show, :edit, :update, :destroy]


    def index
    end 

    def new
        @wall = Wall.new
        @artist = Artist.new
        @artist_counter = 1
        # @wall.artists.build 
        # 1.times{@wall.artists.build} #will add x times as needed.
        1.times{@wall.tags.build}
    end

    def show
    end 

    def create
        raise params.inspect
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
            :collaboration_details,
            artist_names: [],
            wall_tags: [], 
            artists_attributes: [:id, :name, :bio, :hometown, :instagram, :website, :artist_name]
         ) 
    end 

    def set_wall
        @wall = Wall.find(params[:id])
    end



end
