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
        # raise params.inspect
        check_params = location_params
        validate_country(check_params)
        
        @location = Location.new(check_params)
        if @invalid || !@location.save 
            @location.errors[:base] << "Invalid country name, try again." unless !@invalid
            render :new
        else 
            @location.save 
            redirect_to location_path(@location)
        end  

    end 

    def edit
        @request = request.env["REQUEST_PATH"]

    end 

    def update
        if @location.update(location_params)
            redirect_to location_path(@location)
        else
            render :edit
        end   
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

    def validate_country(params)
        
        country_name = params[:country]
        validate = ISO3166::Country.find_country_by_name(country_name)

        if validate
           params[:country] = validate.name 
           params[:continent] = validate.continent
        else
           @invalid = true
        end 

    end

end
