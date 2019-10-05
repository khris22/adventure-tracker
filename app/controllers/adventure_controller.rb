class AdventuresController < ApplicationController
   
    get '/adventures' do
        if logged_in?
            @user = current_user       
            erb :"/adventures/index"
        else
            redirect '/'
          
        end
    end

    get '/adventures/:id' do
    # get '/adventures/:slug' do
        if logged_in?
            @user = current_user
            @adventure = Adventure.find_by(id: params[:id])
            # @adventure = Adventure.find_by_slug(params[:slug])
            erb :"/adventures/show"
            # binding.pry
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
                    # redirect "/adventures/#{@adventure.title.slug}"
                else
                    redirect '/adventures'
                end
            end
        end
    end

    get '/adventures/:id/edit' do
        if logged_in?
            @adventure = Adventure.find_by(id: params[:id])
            if @adventure && @adventure.user == current_user
                erb :"/adventures/edit"
            else
                flash[:error] = "You are NOT authorized to edit/delete if it's not your adventure"
                redirect "/adventures"
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
                redirect "/adventures/#{@adventure.id}/edit"
            else      
                if @adventure && @adventure.user == current_user
                    @adventure.update(title: params[:title], location: params[:location], activity: params[:activity], companion: params[:companion], notes: params[:notes])
                    flash[:message] = "Your adventure has been updated!!!"
                    redirect "/adventures/#{@adventure.id}"
                else
                    flash[:error] = "You are NOT authorized to edit/delete this adventure!"
                    redirect '/adventures'
                end
            end
            flash[:error] = "Please log in"
            redirect to '/adventures'
        end
    end
 
    delete '/adventures/:id' do
        if logged_in?
            @adventure = Adventure.find_by(id: params[:id])
            if @adventure && @adventure.user == current_user
                @adventure.delete
                flash[:message] = "Your adventure has been successfully deleted!"
                redirect to "/adventures"
            else
                flash[:error] = "You are NOT authorized to edit/delete this adventure!"
                redirect to "/adventures"
            end
        else
            flash[:error] = "Please log in"
            redirect '/'
        end
    end

end
