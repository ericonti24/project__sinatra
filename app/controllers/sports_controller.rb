class SportsController < ApplicationController

    get '/sports' do 
        if logged_in?
            erb :"sports/sports"
        else
            redirect '/login'
        end
    end

    post '/sports' do
        @user = current_user
        if params[:name].empty?
            redirect 'sports/new'
        else
            @sport = @user.sport.build(params)
            @user.save
            redirect "sports/#{@sport.id}"
        end
    end 

    get '/sports/new' do 
        if logged_in?
            erb :"sports/register_for_sport"
        else
            redirect '/login'
        end
    end


end

