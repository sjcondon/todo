class UsersController < ApplicationController
    


# GET/register - New user Action
    def new
       @user = User.new
    end

#POST/users - Create the users Action
    def create
        @user = User.new(user_params)
        if @user.save 
            session[:current_user_id] = @user.id
            redirect_to "/", :notice => "Sign up Successful"
        else 
            render :new
        end
    end
 
private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end