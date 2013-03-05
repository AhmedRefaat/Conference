class Paper < ActiveRecord::Base
  validates_presence_of :auth1, :abstract, :title
  attr_accessible :abstract, :auth1, :auth2, :auth3, :auth4, :title,  :user_id, :acceptance
end
