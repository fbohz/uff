class WallsController < ApplicationController
    def new
        @wall = Wall.new
        @wall.artists.build #need to check this and modify
    end
end
