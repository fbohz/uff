class WallsController < ApplicationController
    def new
        @wall = Wall.new
        @wall.artists.build #need to check this and modify
    end
    
    private

    def wall_params
        #NEED TO COMPLETE AND INCLUDE NESTED FORMS ATTRIBUTES TOO
        params.require(:wall).permit() 
    end 
end
