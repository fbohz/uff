class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # skip_before_action :authenticate_user!

    def facebook
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"])
  
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end

    def google_oauth2
      auth = request.env["omniauth.auth"]
      user = User.where(provider: auth["provider"], uid: auth["uid"])
              .first_or_initialize(email: auth["info"]["email"])
      user.password ||= Devise.friendly_token[0, 20]        
      user.name ||= auth["info"]["name"]
      user.email ||= auth["info"]["email"]
      # binding.pry
      user.save!
  
      user.remember_me = true
      sign_in(:user, user)
  
      redirect_to after_sign_in_path_for(user)
    end
  
    def failure
      redirect_to root_path
    end
  end