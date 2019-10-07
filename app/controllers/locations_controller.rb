class LocationsController < ApplicationController
    before_action :set_location, only: [:show, :edit, :update, :destroy]


    private

    def set_location
        @location = Location.find(params[:id])
    end

end
