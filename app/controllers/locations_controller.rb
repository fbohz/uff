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
    end 

    def edit
    end 

    def update
    end 

    def destroy
    end

    private

    def set_location
        @location = Location.find(params[:id])
    end

end
