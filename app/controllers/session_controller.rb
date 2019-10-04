class SessionsController < ApplicationController

  post '/login' do
    user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect '/adventures'
      else
        flash[:message] = "Your username and password should match!"
        redirect '/'
        #put error message "Please try again"
      end    
    end

    get '/logout' do
            session.destroy
            redirect to '/'
    end
end