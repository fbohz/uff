class WallsController < ApplicationController
    def new
        @wall = Wall.new
        @wall.artists.build #need to check this and modify
    end
    
    private

    def wall_params
        #NEED TO COMPLETE AND INCLUDE NESTED FORMS ATTRIBUTES TOO don't forget nested :id too, 
        params.require(:wall).permit() 
    end 
end
