class UsersController < ApplicationController

    get '/signup' do
      if logged_in?
        redirect '/adventures'
      else
        erb :"/user/signup"
      end
    end
    
    post '/user' do
      @user = User.new(params)
        if @user.save
          session[:user_id] = @user.id
          redirect '/adventures'
        else           
          errors = []
          @user.errors.full_messages.map do |err|
            errors << err
        end
            flash[:message] = errors.join(". ")
            #flash[:message] = "ERROR: Please make sure all the details have been filled correctly."
            redirect '/signup'
        end
    end
    
end