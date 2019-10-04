# Custom User Validations    
    # validates :username, presence: {message: "Username cannot be blank"}
    # validates :username, uniqueness: {message: "This username is already taken!"}

    # validates :email, presence: {message: "Please enter your email."}
    # validates :email, uniqueness: {message: "This email has already been used for another account!"}

# Custom Email Validations
     # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
     # constant built into URI in the standard ruby library (from stackoverflow)
     # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

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

Date.today.strftime("%A, %B %d, %Y")

Add new features:
View all the adventures:
<ul>
   <%  Adventure.all.each do |adventure| %>
   <%=  adventure.title %><br>
   <%=  adventure.location %>
   <%= adventure.user.username %>
   <% end %>
  </ul>


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
