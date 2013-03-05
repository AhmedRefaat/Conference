ActiveAdmin.register Paper do
  index do
    column :title
    column :abstract
    column "First Author", :auth1
    column "Second Author", :auth2
    column "Acceptance Status", :acceptance
    default_actions
  end
  
end
