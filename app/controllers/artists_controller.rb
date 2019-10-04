class ArtistsController < ApplicationController

    def new
        @artist = Artist.new
        # 2.times{@artist.walls.build}
        @artist.walls.build
    end 
end
