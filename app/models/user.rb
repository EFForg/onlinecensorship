# User "The administration user"
#
# we have only one user role "the admin" who can review all the users answers or create categories
#
class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
end
