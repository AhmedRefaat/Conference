class User < ActiveRecord::Base
  validates_presence_of :name,:mobile,:city, :country, :address, :mail, :organization
  validates_numericality_of :mobile
  attr_accessible :address, :city, :country, :departement, :faculty, :job, :mail, :mobile, :name, :organization, :user_status, :officer, :admin
  

end
