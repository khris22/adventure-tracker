# Custom User Validations    
    # validates :username, presence: {message: "Username cannot be blank"}
    # validates :username, uniqueness: {message: "This username is already taken!"}

    # validates :email, presence: {message: "Please enter your email."}
    # validates :email, uniqueness: {message: "This email has already been used for another account!"}


to add styling to flash messages:
https://foundation.zurb.com/sites/docs/v/5.5.3/components/alert_boxes.html

To add for later:
password length - maxlength="8"


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
