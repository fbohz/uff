class ArtistsController < ApplicationController

    def new
        @artist = Artist.new
        # 2.times{@artist.walls.build}
        @artist.walls.build
    end 

    private

    def artist_params
       #NEED TO COMPLETE AND INCLUDE NESTED FORMS ATTRIBUTES TOO
       params.require(:artist).permit() 
    end 
end
