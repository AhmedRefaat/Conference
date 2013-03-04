class Auser < ActiveRecord::Base
  attr_accessible :password_digest, :username
end
