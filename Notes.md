# ADD NEW FEATURES
- add checkbox for activity column (ex. hiking, camping, others etc)
- dropdown for state
- button on wishlist that tranfers it to adventures once it was done

- password length, email format validation, .find_by_slug method
- fix css styling and design
- 


# Custom User Validations    
    # validates :username, presence: {message: "Username cannot be blank"}
    # validates :username, uniqueness: {message: "This username is already taken!"}

    # validates :email, presence: {message: "Please enter your email."}
    # validates :email, uniqueness: {message: "This email has already been used for another account!"}

# Custom Email Validations
     # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
     # constant built into URI in the standard ruby library (from stackoverflow)
     # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
     # validates_format_of :email, :with => /@/ 
     # validates_format_of :email, format: /@/

# To add styling to flash messages:
https://foundation.zurb.com/sites/docs/v/5.5.3/components/alert_boxes.html

To add for later:
password length - maxlength="8"

# User_Controller Notes
    #user = User.new(username: params[:username], email: params[:email], password: params[:password])
    
# User_Controller Error Messages
            # @user.errors.map do |keys, error|
            #   @errors = error
            # end

            # this is working
            # all_errors = []
            # @user.errors.messages.each do |attr, error_message|
            #   all_errors << error_message[0]
            # end

# Adventure_Controller Notes
    # @adventure = Adventure.find_by(id: params[:id])
    # @adventure = current_user.adventures
    # @adventure = @adventures.user.find_by(params[:id])
    # @adventure = Adventure.find_by(params[:id])

# Adventure Model (slug title)
  #tested it on binding.pry and it's working:
  #title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  from stackoverflow: downcase makes it lowercase. The strip makes sure there is no leading or trailing whitespace. The first gsub replaces spaces with hyphens. The second gsub removes all non-alpha non-dash non-underscore characters (note that this set is very close to \W but includes the dash as well, which is why it's spelled out here).

# Add new features:
View all the adventures:
<ul>
   <%  Adventure.all.each do |adventure| %>
   <%=  adventure.title %><br>
   <%=  adventure.location %>
   <%= adventure.user.username %>
   <% end %>
  </ul>

# Flash errors hash on layout.erb
     <% if flash[:message] %>
        <div class="<%= flash[:type] %>">
          <ul>
            <% flash[:message].each do |message| %>
              <li><%= message %></li>
            <% end %>
          </ul>
        </div>
      <% end %>

          <% flash.keys.each do |type| %>
          <div data-alert class="flash <%= type %> alert-box radius">
            <%= flash[type] %>
            <!-- for closing the flash? Must fix!!! -->
            <a href="#" class="close">&times;</a>
          </div>
        <% end %>

  
