class User < ActiveRecord::Base
    has_many :adventures
    has_secure_password

    # validates :email, presence: { message: "Please enter your email." }
    # validates :email, uniqueness: {message: "This email has already been used for another account!"}
    #not working:
    # validates(:email,
    #             :presence   => {:message => "Email can't be blank"},
    #             :uniqueness => {:message => 'Email must be unique'},
    #             :email      => {:message => 'Email must be valid'})
   
    # validates :username, presence: { message: "Username cannot be blank" }
    # validates :username, uniqueness: {message: "This username is already taken!"}
    # validates :username, uniqueness: true
    # uniqueness: {
    #   message: ->(object, data) do
    #     "Hey #{user.username}!, #{data[:value]} is taken already!"
    #   end
    # }

    validates :username, uniqueness: true
    validates :email, uniqueness: true
    validates :email, presence: true

end

 # https://www.rubydoc.info/gems/active-model-email-validator/1.0/EmailValidator
 #length: { in: 6..20, }

     # must have validations
    # validates :email, presence: { message: "Please enter your email." }