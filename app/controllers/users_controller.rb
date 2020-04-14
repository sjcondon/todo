class UsersController < ApplicationController


# GET/register - New user Action
    def new
        if session[:current_user_id]
            redirect_to "/", :notice => "Already logged in"
        end
    end

#POST/users - Create the users Action
    def create
        @user = User.new(user_params)
        @user.save

        redirect_to "/login"
    end
 
private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end