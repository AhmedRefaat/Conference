ActiveAdmin.register User do
  index do 
    column "Name", :name
    column "Orgnization", :organization
    column "Country", :country
    column "Email", :mail
    default_actions
  end
  
end