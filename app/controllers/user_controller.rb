class UserController < ApplicationController

    get "/signup" do 
        erb :"/users/signup"
    end

    post "/signup" do 
        user = User.new(:username => params[:username], :password => params[:password])
        if user.save
            redirect "/loggedin"
        else
            redirect "/error"
        end
    end

    get "/login" do 
        erb :"/users/login"
    end

    post "/login" do 
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect "/loggedin"
        else
            redirect "/error"
        end
    end

    get "/start" do 
        if logged_in?
            erb :"/users/start" 
        else 
            redirect "/login"
        end
    end

    get "/error" do 
        erb :"/users/error" 
    end

    get "/loggedin" do 
        erb :"/users/loggedin"
    end

    get "/logout" do 
        session.clear
        redirect "/"
    end
end