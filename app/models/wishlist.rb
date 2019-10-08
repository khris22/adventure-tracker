class Wishlist < ActiveRecord::Base
    belongs_to :user

    validates :title, :location, presence: true
end