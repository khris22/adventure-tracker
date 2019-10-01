steve = User.create(username: "steve_04", email:"steve@mail.com", password:"stevedc")
khris = User.create(username: "Kp12", email:"khris@yahoo.com", password:"forgotten")
boris = User.create(username: "B_o_R_i_S", email:"boris@hotmail.com", password:"GiveMeTreats")



grandcanyon = Adventure.create( 
title: "Grand Canyon Adventure" , 
location: "Arizona", 
activity: "Hiking & Camping", 
companion: "Khris",
notes: "must have 4x4, bring sunscreen",
user_id: steve.id)


redrock = Adventure.create( 
title: "Red Rock!!!" , 
location: "Las Vegas", 
activity: "Hiking", 
companion: "Isay, Ariel",
notes: "Ice Box Canyon has a great waterfall!",
user_id: khris.id)

rocky_mountain = Adventure.create( 
title: "Rocky Mountain National Park" , 
location: "CO", 
activity: "stargazing", 
companion: "",
notes: "High altitude! Remember to bring jacket!",
user_id: boris.id)
