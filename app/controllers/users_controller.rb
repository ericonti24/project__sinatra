class UsersController < ApplicationController

    get '/signup' do 
        if logged_in?
            redirect '/sports'
        else
            erb :"users/create_users"
        end
    end

    get '/users/:slug' do 
        @user = User.find_by_slug(params[:slug])
        erb :"/users/show"
    end

    post '/signup' do
        binding.pry
        @user = User.new(params)
        if params[:username].empty? || params[:email].empty? || params[:password].empty?
          redirect '/signup'
        end
        if @user.save
          session[:user_id] = @user.id
          redirect '/sports'
        end
    end
       
    get '/login' do 
        if logged_in?
            redirect '/sports'
        else
            erb :"users/login"
        end
    end

    post '/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/sports'
        else
            redirect '/login'
        end
    end

    get '/logout' do 
        if logged_in?
            session.clear
            redirect '/login'
        else
            redirect '/'
        end
    end
    
end