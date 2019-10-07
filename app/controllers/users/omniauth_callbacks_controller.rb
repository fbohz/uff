class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :set_user 
  
  # skip_before_action :authenticate_user!

    def facebook
      validate_user("facebook")
    end

    def google_oauth2
      validate_user("google")
    end 
    
    def failure
      redirect_to root_path
    end

    def set_user
      # method below implemented in user model (e.g. app/models/user.rb)     
      @user = User.from_omniauth(request.env["omniauth.auth"])
    end
    
    def validate_user(provider)
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "#{provider.capitalize}") if is_navigational_format?
      else
        session["devise.#{provider.downcase}_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  end