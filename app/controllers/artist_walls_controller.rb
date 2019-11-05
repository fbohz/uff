class ArtistWallsController < ApplicationController
    before_action :set_artist_wall, only: [:update]
    before_action :authenticate_user!, only: [:update]


    def update
        #discovered some weird behavior on local, collab details might have to be refactored to be just an attribute of Wall to make it easier to deal. 
        if @artist_wall.update(collaboration_details: artist_wall_params["collaboration_details"])
         
            flash[:notice] = "Collaboration Details Updated!"
            redirect_to wall_path(@artist_wall.wall_id)
        else
            render '/walls/show'
        end   
    end 

    private

    def artist_wall_params
       params.require(:artist_wall).permit(:collaboration_details, :artist_id, :wall_id, :id) 
    end 

    def set_artist_wall
        @artist_wall = ArtistWall.find_by_id(params[:id])
    end
      
end

