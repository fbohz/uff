class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :edit]

    def index
        # for has_many you can do an includes here if necessary e.g. @post = Post.includes(:category)
        @artists = Artist.all
    end 

    def new
        @artist = Artist.new
        # 2.times{@artist.walls.build}
        @artist.walls.build
    end 

    def show
    end 

    def create
        check_params = artist_params
        add_http_protocol(check_params)
        @artist = Artist.new(check_params)
        if @artist.save
            redirect_to artist_path(@artist)
        else
            render :new
        end        
    end 

    def edit

    end 

    def update
        check_params = artist_params
        add_http_protocol(check_params)

        if @artist.update(check_params)
            flash[:notice] = "Artist updated!"
            redirect_to artist_path(@artist)
        else
            render :edit
        end   
    end 

    def destroy
    end

    def latest_artists
        @latest_artists = Artist.latest_artists.limit(4)
        # binding.pry
    end 

    private

    def artist_params
       #NEED TO COMPLETE AND INCLUDE NESTED FORMS ATTRIBUTES TOO don't forget nested :id too, 
       params.require(:artist).permit(:name, :hometown, :instagram, :website, :bio, :image, :wall_id, :location_id) 
    end 

    def set_artist
        @artist = Artist.find(params[:id])
    end

    def add_http_protocol(params)
        array = ["#{params[:instagram]}", "#{params[:website]}"]
        array.collect! do |url|
            url = "http://#{url}" unless url[/\Ahttp:\/\//] || url[/\Ahttps:\/\//] || url.empty? 
         end
         params[:instagram] = array[0] if array[0]
         params[:website] = array[1] if array[1]
     end
      
end
