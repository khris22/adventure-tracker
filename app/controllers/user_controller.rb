class UsersController < ApplicationController

    get '/signup' do
        erb :"/user/signup"
      end
    
      post '/user' do
        user = User.new(params)
        # user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if user.save
          session[:user_id] = user.id
          redirect '/adventures'
          # "/welcome"
          # redirect to login page, message your account has been created please log in
        else
          redirect '/signup'
          #Please try again (make sure all the details have been filled)
        end
      end
    

end