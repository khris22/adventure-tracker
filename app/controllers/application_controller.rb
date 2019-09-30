require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "app_session"
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
      # redirect to /username/adventures - username needs to be slug & interpolated
      redirect "#{user}"
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
