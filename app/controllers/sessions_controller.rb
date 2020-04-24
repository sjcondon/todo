class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(:email => params[:email]) #find user by email typed in
        if @user
            #logging in a user
            login(@user)
            redirect_to "/", :notice => "Log in Successful"
        else
            # redirect_to "/login", :notice => "Cannot find that email"
            render :new
        end
    end

    def destroy
        reset_session
        redirect_to "/"
    end
end


