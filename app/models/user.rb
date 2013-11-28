class User < ActiveRecord::Base

	#Validations
	validates :name, presence: true, unless: :has_social_login?
	validates :username, presence: true, uniqueness: true, unless: :has_social_login?
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, confirmation: true, unless: :has_social_login?

	#this is part of rails, puts the unencrypted password into database with password_digest
	has_secure_password validations: false

	def has_social_login?
		facebook_id.present? or twitter_id.present? or linkedin_id.present?
	end

end
