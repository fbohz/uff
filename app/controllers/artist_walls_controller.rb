class ArtistWallsController < ApplicationController
    before_action :set_artist_wall, only: [:update]
    before_action :authenticate_user!, only: [:update]


    def update
        if @artist_wall.update(collaboration_details: artist_wall_params["collaboration_details"])
         
            flash[:notice] = "Collaboration Details Updated!"
            redirect_to wall_path(params[:id])
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

