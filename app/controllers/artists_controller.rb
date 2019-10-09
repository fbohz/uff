class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :edit, :update, :destroy]

    def index
    end 

    def new
        @artist = Artist.new
        # 2.times{@artist.walls.build}
        @artist.walls.build
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

    private

    def artist_params
       #NEED TO COMPLETE AND INCLUDE NESTED FORMS ATTRIBUTES TOO don't forget nested :id too, 
       params.require(:artist).permit(:name, :hometown, :instagram, :website, :bio, :image) 
    end 

    def set_artist
        @artist = Artist.find(params[:id])
    end
      
end
