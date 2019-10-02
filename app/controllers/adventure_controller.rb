class AdventuresController < ApplicationController
   
    get '/adventures' do
        if logged_in?
            # binding.pry
            @user = current_user
            # @adventure = current_user.adventures
            erb :"/adventures/index"
        else
            redirect '/'
          
        end
    end

    get '/adventures/:id' do
        if logged_in?
            @user = current_user
            @adventure = Adventure.find_by(id: params[:id])
            # @adventure = @adventures.user.find_by(params[:id])
            # @adventure = Adventure.find_by(params[:id])
            erb :"/adventures/show"
        else
            redirect '/adventures'
        end
    end

    post '/adventures' do
        if logged_in?
            @user = User.find_by_id(params[:user_id])
            if params[:title].empty? && params[:location].empty?
                redirect '/adventures'
            else
                @adventure = current_user.adventures.build(title: params[:title], location: params[:location], activity: params[:activity], companion: params[:companion], notes: params[:notes])
                if @adventure.save
                    redirect "/adventures/#{@adventure.id}"
                else
                    redirect '/adventures'
                end
            end
        end
    end

    #make edit route
    get '/adventures/:id/edit' do
        if logged_in?
            @adventure = Adventure.find_by(id: params[:id])
            if @adventure && @adventure.user == current_user
                # binding.pry
                erb :"/adventures/edit"
            else
                redirect :"/adventures/#{@adventure.id}"
            end
        else
            redirect '/adventures'
        end
    end

    #make delete each adventure route
 

end

  #error message here "Please log in to view your adventures