class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :edit, :update, :destroy]

    # after_validation :add_http_protocol

    def index
    end 

    def new
        @artist = Artist.new
        # 2.times{@artist.walls.build}
        @artist.walls.build
    end 

    def show
    end 

    def create
        # raise params.inspect
        @artist = Artist.new(artist_params)
        add_http_protocol
        if @artist.save
            redirect_to artist_path(@artist)
        else
            render :new
        end        
    end 

    def edit
    end 

    def update
    end 

    def destroy
    end

    private

    def artist_params
       #NEED TO COMPLETE AND INCLUDE NESTED FORMS ATTRIBUTES TOO don't forget nested :id too, 
       params.require(:artist).permit(:name, :hometown, :instagram, :website, :bio, :image, :wall_id, :location_id) 
    end 

    def set_artist
        @artist = Artist.find(params[:id])
    end

    def add_http_protocol
        array = ["#{@artist.instagram}", "#{@artist.website}"]
        array.collect! do |url|
            unless url[/\Ahttp:\/\//] || url[/\Ahttps:\/\//] || url.empty? 
            url = "http://#{url}"
            end
         end
        @artist.instagram = array[0]
        @artist.website = array[1]
     end
      
end
