class User < ActiveRecord::Base

	#Validations
	validates :name, presence: true
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true

	#this is part of rails, puts the unencrypted password into database with password_digest
	has_secure_password

end
