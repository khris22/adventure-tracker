# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database

- [x] Include more than one model class 
- [x] Include at least one has_many relationship on your User model 
- [x] Include at least one belongs_to relationship on another model 
        * AdventureTracker has a User model and an Adventure model. User has_many adventures and an adventure belongs_to a user.
- [x] Include user accounts with unique login attribute (username or email)
        * Created an ActiveRecord validation on username & email uniqueness
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [x] Ensure that users can't modify content created by other users
        * Done by creating helper methods and sessions
- [x] Include user input validations
        * Checked if the created adventure has a title & location 
- [x] BONUS - not required - Display validation failures to user with error message 
        * Made using the `gem 'sinatra-flash'`.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
        * License & code of conduct were created using github's template.
        * Readme has a short description and installation guide. 

Confirm
- [x] You have a large number of small Git commits
        * More than 80 commits now as of this writing
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message

Additional:
- [x] Users should create a password, and your code should implement has_secure_password
- [x] User input validations can be done on the controller(s); use of ActiveRecord validations in optional