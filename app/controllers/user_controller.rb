class UsersController < ApplicationController
    has_many :adventures
    has_secure_password
end