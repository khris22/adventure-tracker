class User < ActiveRecord::Base
    has_many :adventures
    has_secure_password
end