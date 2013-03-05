ActiveAdmin.register User do
  index do 
    column "Name", :name
    column "Orgnization", :organization
    column "Country", :country
    column "Email", :mail
  end
  
end
