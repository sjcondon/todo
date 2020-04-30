class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_or_create_from_auth_hash(auth_hash)
        self.current_user = @user
        redirect_to '/'
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

    protected

    def auth_hash
        request.env['omniauth.auth']
    end
end


