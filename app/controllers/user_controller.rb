class UsersController < ApplicationController

    get '/signup' do
        erb :"/user/signup"
      end
    
      post '/user' do
        @user = User.new(params)
        # user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if @user.save
          session[:user_id] = @user.id
          redirect '/adventures'
          # "/welcome"
          # redirect to login page, message your account has been created please log in
        else
            binding.pry
            # @user.errors.map do |keys, error|
            #   @errors = error
            # end

          @users.errors.full_messages.map do |err|
            err
          end

            # this is working
            # all_errors = []
            # @user.errors.messages.each do |attr, error_message|
            #   all_errors << error_message[0]
            # end
            # flash[:message] = all_errors

            #  flash[:message] = "EEERRRRRROOOORRRR"
          redirect '/signup'
          #Please try again (make sure all the details have been filled)
        end
      end
    

end