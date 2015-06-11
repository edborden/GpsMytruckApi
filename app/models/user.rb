class User < ActiveRecord::Base
	has_secure_password
	has_many :companies
	has_one :session, as: :sessionable

end