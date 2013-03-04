class Auser < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :password_digest
  validates :username, presence: true, uniqueness:true
  has_secure_password
end
