class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :get_title
    skip_before_action :get_title, only: [:not_found]

    rescue_from 'ActiveRecord::RecordNotFound' do
      render 'notice/404', :status => '404'
    end

    def get_title
      if !@title
        path = request.env["REQUEST_PATH"].titleize.split("/")
        string = path[1].singularize if path[1]
        string.prepend("#{path[2] if path[2] && path[2].to_i == 0} ")
        string += " #{path[3] if path[3]}"
        string.prepend("#{path[4].singularize if path[4]}")
        @title = "Uff!" + " - #{string if string}"
      end 
    end

    def not_found
      # raise ActionController::RoutingError.new('Not Found')
      render 'notice/404', :status => '404'
    end



    protected
  
    def configure_permitted_parameters
      attributes = [:name, :provider, :uid, :google_refresh_token, :google_token]
      devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
      devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end
end
