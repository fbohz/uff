class ArtistWallsController < ApplicationController
    before_action :set_artist_wall, only: [:update]
    before_action :authenticate_user!, only: [:update]


    def update
        raise artist_wall_params.inspect
        if @artist_wall.update(artist_wall_params)
            flash[:notice] = "Collaboration Details Updated!"
            redirect_to wall_path(@artist_wall)
        else
            render '/walls/show'
        end   
    end 

    private

    def artist_wall_params
       params.require(:artist_wall).permit(:collaboration_details, :artist_id, :wall_id, :id) 
    end 

    def set_artist_wall
        @artist_wall = ArtistWall.find(params[:id])
    end
      
end
