steve = User.create(username: "steve_04", email:"steve@mail.com", password:"stevedc")
khris = User.create(username: "Kp12", email:"khris@yahoo.com", password:"forgotten")
boris = User.create(username: "B_o_R_i_S", email:"boris@hotmail.com", password:"GiveMeTreats")



grandcanyon = Adventure.create( 
title: "Grand Canyon Adventure" , 
location: "Arizona", 
activity: "Hiking & Camping", 
companion: "Khris",
created_at: "",
updated_at: "",
user_id: steve.id)


redrock = Adventure.create( 
title: "Red Rock!!!" , 
location: "Las Vegas", 
activity: "Hiking", 
companion: "Isay, Ariel",
created_at: "",
updated_at: "",
user_id: khris.id)

rocky_mountain = Adventure.create( 
title: "Rocky Mountain National Park" , 
location: "CO", 
activity: "stargazing", 
companion: "",
created_at: "",
updated_at: "",
user_id: boris.id)
