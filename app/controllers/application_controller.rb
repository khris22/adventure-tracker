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

end
