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

  get '/login' do
  end

end
