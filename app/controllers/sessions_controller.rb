class SessionsController < ApplicationController

    def new
    end

    def create
        if auth_hash = request.env["omniauth.auth"]
            #log in via OAuth
            raise auth_hash.inspect
            request.env["omniauth.auth"]["email"] #person is trusted and coming from github
            @user = User.find_by(:email => request.env["omniauth.auth"]["email"])
            #they have already been loggin
        else
            #normal login with un and pw
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



