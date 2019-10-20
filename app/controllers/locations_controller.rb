class LocationsController < ApplicationController
    before_action :set_location, only: [:show, :edit, :update, :destroy]
   
    def index
        case
        when params[:id]
            location = Location.find_by_id(params[:id])
            if location
                @walls = location.walls
                @city = location.city
                render "location_walls"
            else 
                flash[:alert] = "Location not found"
                redirect_to locations_path
            end
        else    
            @locations = Location.all
            @count = @locations.length
        end 
    end 

    def new
        @location = Location.new
    end 

    def show
    end 

    def create
        # raise params.inspect
        check_params = location_params
        validate_country(check_params)

        @location = Location.find_or_initialize_by(check_params)

        if @invalid || !@location.save 
            @location.errors[:base] << "Invalid country name, try again." unless !@invalid
            render :new
        else 
            @location.save 
            redirect_to location_path(@location)
        end  

    end 

    def edit
        @read = true

    end 

    def update
        if @location.update(location_params)
            flash[:notice] = "Location updated!"
            redirect_to location_path(@location)
        else
            render :edit
        end   
    end 

    def destroy
    end

    private

    def location_params
        params.require(:location).permit(:city, :continent, :country) 
     end 

    def set_location
        @location = Location.find(params[:id])
    end

    def validate_country(params)
        
        if params[:country].downcase == "england"
            country_name = "United Kingdom"
        else
            country_name = params[:country]
        end 

        validate = ISO3166::Country.find_country_by_name(country_name)

        case
        when validate && validate.name == "United Kingdom of Great Britain and Northern Ireland"
            params[:country] = "United Kingdom"
            params[:continent] = validate.continent
        when validate
            params[:country] = validate.name 
            params[:continent] = validate.continent
        else
           @invalid = true
        end 

    end

end
