class User < ActiveRecord::Base
  attr_accessible :crypted_password, :email, :password_salt, :persistence_token, :username, :password, :password_confirmation
  has_and_belongs_to_many :problems
  easy_roles :roles
  acts_as_authentic
end
