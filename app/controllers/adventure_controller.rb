class AdventuresController < ApplicationController
   
    get '/adventures' do
        if logged_in?
            @user = current_user
            erb :"/adventures/index"
        else
            redirect '/'
          
        end
    end

end

  #error message here "Please log in to view your adventures