class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if auth_hash = request.env["omniauth.auth"]
            @user = User.find_or_create_by_omniauth(auth_hash)
            session[:current_user_id] = @user.id

            redirect_to "/"
           
        elsif @user = User.find_by(:email => params[:email])
            #normal login with un and pw
             #find user by email typed in
        
            if @user && @user.authenticate(params[:password])
                    session[:current_user_id] = @user.id
                    #logging in a user
                    #login(@user)
            
                    redirect_to "/", :notice => "Log in Successful"
            else
                # redirect_to "/login", :notice => "Cannot find that email"
                @error = "Incorrect Password"  
                render :new
            end      
        else 
            @error = "Couldn't find user, please try again"
            # redirect_to "/login", :notice => "Cannot find that email"
                render :new
        end
    end

    def destroy
        reset_session
        redirect_to "/"
    end
end



