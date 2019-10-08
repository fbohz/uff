class WallsController < ApplicationController
    before_action :set_wall, only: [:show, :edit, :update, :destroy]

    def index
    end 

    def new
        @wall = Wall.new
        @wall.artists.build #need to check this and modify
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

    def wall_params
        #NEED TO COMPLETE AND INCLUDE NESTED FORMS ATTRIBUTES TOO don't forget nested :id too, 
        params.require(:wall).permit() 
    end 

    def set_wall
        @wall = Wall.find(params[:id])
    end
end
