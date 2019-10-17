class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :get_title 

    def get_title
      if !@title
        path = request.env["REQUEST_PATH"].titleize.split("/")
        string = path[1].singularize if path[1]
        string.prepend("#{path[2] if path[2]} ")
        @title = "Uff!" + " - #{string if string}"
      end 
    end

    protected
  
    def configure_permitted_parameters
      attributes = [:name, :provider, :uid, :google_refresh_token, :google_token]
      devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
      devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end
end
