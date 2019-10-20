class HomeController < ApplicationController
    skip_before_action :get_title

    def index
        @latest_walls = Wall.latest_walls
    end 

end
