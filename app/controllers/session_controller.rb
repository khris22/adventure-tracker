class SessionsController < ApplicationController

    get '/logout' do
            session.destroy
            redirect to '/'
    end
end