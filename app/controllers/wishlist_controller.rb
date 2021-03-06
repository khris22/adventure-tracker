class WishlistsController < ApplicationController
    get '/wishlists' do
        if logged_in?
            @user = current_user       
            erb :"/adventures/index"
        else
            redirect '/'
        end
    end

    get '/wishlists/:id' do
            if logged_in?
                @user = current_user
                @wishlist = Wishlist.find_by(id: params[:id])
                erb :"/wishlists/show"
            else
                redirect '/adventures'
            end
        end

        post '/wishlists' do
            if logged_in?
                @user = User.find_by_id(params[:user_id])
                if params[:title].empty? && params[:location].empty?
                    flash[:error] = "Title and Location cannot be empty!"
                    redirect '/adventures'
                else
                    @wishlist = current_user.wishlists.build(title: params[:title], location: params[:location], activity: params[:activity], companion: params[:companion], notes: params[:notes])
                    if @wishlist.save
                        flash[:message] = "Your wishlist has been saved"
                        redirect "/wishlists/#{@wishlist.id}"
                    else
                        redirect '/adventures'
                    end
                end
            end
        end

        get '/wishlists/:id/edit' do
            if logged_in?
                @wishlist = Wishlist.find_by(id: params[:id])
                if @wishlist && @wishlist.user == current_user
                    erb :"/wishlists/edit"
                else
                    flash[:error] = "You are NOT authorized to edit/delete somebody else's wishlist"
                    redirect "/adventures"
                end
            else
                redirect '/adventures'
            end
        end

        patch '/wishlists/:id' do
            @wishlist = Wishlist.find_by(id: params[:id])
            if logged_in?
                if params[:title].empty? && params[:location].empty?
                    flash[:error] = "Title and Location cannot be empty!"
                    redirect "/wishlists/#{@wishlist.id}/edit"
                else      
                    if @wishlist && @wishlist.user == current_user
                        @wishlist.update(title: params[:title], location: params[:location], activity: params[:activity], companion: params[:companion], notes: params[:notes])
                        flash[:message] = "Your wishlist has been updated!!!"
                        redirect "/wishlists/#{@wishlist.id}"
                    else
                        flash[:error] = "You are NOT authorized to edit/delete somebody else's wishlist"
                        redirect '/adventures'
                    end
                end
                flash[:error] = "Please log in"
                redirect to '/adventures'
            end
        end

        delete '/wishlists/:id' do
            if logged_in?
                @wishlist = Wishlist.find_by(id: params[:id])
                if @wishlist && @wishlist.user == current_user
                    @wishlist.delete
                    flash[:message] = "Your wishlist has been successfully deleted!"
                    redirect to "/adventures"
                else
                    flash[:error] = "You are NOT authorized to edit/delete somebody else's wishlist"
                    redirect to "/adventures"
                end
            else
                flash[:error] = "Please log in"
                redirect '/'
            end
        end

end