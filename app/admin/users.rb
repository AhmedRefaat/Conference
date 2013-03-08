ActiveAdmin.register User do
  index do 
    column "Name", :name
    column "Orgnization", :organization
    column "Country", :country
    column "Email", :mail
    column :admin
    column :officer
    
    default_actions
  end
    action_item do
    link_to "Home", conf_home_path 
  end
end
