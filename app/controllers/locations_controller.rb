class LocationsController < ApplicationController
    before_action :set_location, only: [:show, :edit, :update, :destroy]
   
    def index
    end 

    def new
        @location = Location.new
        # 2.times{@artist.walls.build}
        # @artist.walls.build
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

    def location_params
        #NEED TO COMPLETE AND INCLUDE NESTED FORMS ATTRIBUTES TOO don't forget nested :id too, 
        params.require(:location).permit(:city, :continent, :country) 
     end 

    def set_location
        @location = Location.find(params[:id])
    end

end
