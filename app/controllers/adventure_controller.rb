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
                flash[:error] = "Title and Location cannot be empty!"
                redirect '/adventures'
            else
                @adventure = current_user.adventures.build(title: params[:title], location: params[:location], activity: params[:activity], companion: params[:companion], notes: params[:notes])
                if @adventure.save
                    flash[:message] = "Your new adventure has been saved"
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
                flash[:error] = "You are NOT authorized to edit/delete if it's not your adventure"
                redirect "/adventures"
                #not your post!!!
            end
        else
            redirect '/adventures'
        end
    end

    patch '/adventures/:id' do
        @adventure = Adventure.find_by(id: params[:id])
        if logged_in?
            if params[:title].empty? && params[:location].empty?
                flash[:error] = "Title and Location cannot be empty!"
                #You have to fill in the title & location
                redirect "/adventures/#{@adventure.id}/edit"
            else
            # @adventure = Adventure.find_by(id: params[:id])
            if @adventure && @adventure.user == current_user
                # binding.pry
                @adventure.update(title: params[:title], location: params[:location], activity: params[:activity], companion: params[:companion], notes: params[:notes])
                flash[:message] = "Your adventure has been updated!!!"
                redirect "/adventures/#{@adventure.id}"
                # flash "Your page has been updated!"

            else
                flash[:error] = "You are NOT authorized to edit/delete this adventure!"
                redirect '/adventures'
                # flash You cannot edit another person's adventure
            end
        end
            flash[:error] = "Please log in"
            #flash You need to be logged in to edit this page
            redirect to '/adventures'
        end
    end
    
    #make delete each adventure route
 
    delete '/adventures/:id' do
        if logged_in?
            @adventure = Adventure.find_by(id: params[:id])
            if @adventure && @adventure.user == current_user
                @adventure.delete
                #Adventure: adventure.title has been deleted
                flash[:message] = "Your adventure has been deleted!"
                redirect to "/adventures"
            else
                flash[:error] = "You are authorized to edit/delete this adventure!"
                #You are not authorized to delete this page.
                #not your post!!!
                redirect to "/adventures"
            end
        else
            flash[:error] = "Please log in"
            redirect '/'
            #You must log in to delete your page
        end
    end


end
