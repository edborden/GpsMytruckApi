class User < ActiveRecord::Base
	#has_secure_password
	has_many :companies
	has_one :session, as: :sessionable

	def authenticate password
		password == "pass"
	end

end