class AdventuresController < ApplicationController
   
    def '/adventures' do
        if logged_in?
            @user = current_user
            erb :"/adventures/index"
        else
            redirect '/'
            #error message here "Please log in to view your adventures"
    end

end