class User < ActiveRecord::Base
    has_many :adventures
    has_secure_password

    # must have validations
    # validates :email, presence: { message: "Please enter your email." }
    
    validates (:email,
                :presence   => {:message => "Email can't be blank"},
                :uniqueness => {:message => 'Email must be unique'},
                :email      => {:message => 'Email must be valid'})
    # https://www.rubydoc.info/gems/active-model-email-validator/1.0/EmailValidator

    validates :username, uniqueness: {
      message: ->(object, data) do
        "Hey #{object.name}!, #{data[:value]} is taken already!"
      end
    }

    validates :password, presence: true #length: { in: 6..20, }
end