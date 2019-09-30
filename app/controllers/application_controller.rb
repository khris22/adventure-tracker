require './config/environment'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "app_session"
    register Sinatra::Flash
  end

  get '/' do
    erb :welcome
  end

  get '/signup' do
    erb :"/user/signup"
  end

  post '/signup' do
    user = User.new(params)
    # user = User.new(username: params[:username], email: params[:email], password: params[:password])
    if user.save
      redirect '/adventures'
      # "/welcome"
      # redirect to login page, message your account has been created please log in
    else
      redirect '/signup'
      #Please try again (make sure all the details have been filled)
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect '/adventures'
      else
        redirect '/'
        #put error message "Please try again"
      end    
    end

    helpers do
      def logged_in?
        !!session[:user_id]
      end

      def current_user
        User.find_by_id(session[:user_id])
      end
    end

end
