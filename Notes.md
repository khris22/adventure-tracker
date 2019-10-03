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