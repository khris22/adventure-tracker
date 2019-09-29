class UsersController < ApplicationController
    has_many :adventures
    has_secure_password

    # must have validations
    validates :email, presence: { message: "Please enter your email." }
    
end