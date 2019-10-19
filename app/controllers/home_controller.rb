class HomeController < ApplicationController
    skip_before_action :get_title

    def index
        # @latest_walls = Wall.latest_walls.limit(4)

        # latest walls as old walls to test only
        @latest_walls = Wall.old_walls.limit(4)
        # binding.pry
    end 

end
