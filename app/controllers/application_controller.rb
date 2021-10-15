require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "readyplayer"
  end

  get "/" do
    if logged_in?
      get '/sports'
    else
      erb :index
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

  # get '/signup' do 
  #   "Did it work?"
  # end

end
