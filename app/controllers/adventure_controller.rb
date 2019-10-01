class AdventuresController < ApplicationController
   
    get '/adventures' do
        if logged_in?
            # binding.pry
            @user = current_user
            erb :"/adventures/index"
        else
            redirect '/'
          
        end
    end

    post '/adventures' do
        if logged_in?
            if params[:title].empty? && params[:location].empty?
                redirect '/adventures'
            else
                @adventure = current_user.adventures.build(params)
                if @adventure.save
                    redirect "/adventures/#{@adventure.id}"
                else
                    redirect '/adventures'
                end
            end
        end
    end

    # get '/adventures/index' do
    #     if logged_in?
    #         @user = current_user
    #         erb :"/adventures/index"
    #     else
    #         redirect '/'
    #     end
    # end

end

  #error message here "Please log in to view your adventures