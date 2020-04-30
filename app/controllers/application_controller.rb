class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    helper_method :login?, :current_user
    helper_method :login?
 

    #Action / end pt to Http request
    def home
    end

private
#helpers / methods userd in other actions
    def current_user
      if session[:current_user_id]
         @current_user = User.find(session[:current_user_id])
    end
  end
  
    def login?
      !current_user.nil?  
    end 
 
  end
