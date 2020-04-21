class UsersController < ApplicationController


# GET/register - New user Action
    def new
       @user = User.new
    end

#POST/users - Create the users Action
    def create
        @user = User.new(user_params)
        if @user.save 
            redirect_to "/login"
        else
            redirect_to "/signup", :notice => "Password Cannot be Blank"
        end
    end
 
private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end