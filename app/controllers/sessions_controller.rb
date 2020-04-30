class SessionsController < ApplicationController

    def new
    end

    def create
        if auth_hash = request.env["omniauth.auth"]
            @user = User.find_or_create_by_omniauth(auth_hash)
            sessions[:current_user.id] = current_user.id
            
            redirect_to "/"
           
        else
            #normal login with un and pw
            @user = User.find_by(:email => params[:email]) #find user by email typed in
            if @user && user.authentication (params [:password])
                sessions[:current_user.id] = current_user.id
                #logging in a user
                login(@user)
                redirect_to "/", :notice => "Log in Successful"
            else
            # redirect_to "/login", :notice => "Cannot find that email"
                render :new
        end
    end
end

    def destroy
        reset_session
        redirect_to "/"
    end



