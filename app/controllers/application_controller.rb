class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "secret69420"
  end

  get "/" do
    if logged_in? 
      redirect "/loggedin"
    else
      erb :"/users/home"
    end
  end

  helpers do 
    def logged_in?
      !!session[:user_id]
    end
    def current_user
      User.find(session[:user_id])
    end
  end

end
