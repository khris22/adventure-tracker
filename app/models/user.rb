class User < ActiveRecord::Base
    has_many :adventures
    has_many :wishlists
    has_secure_password

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
end