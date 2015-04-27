class UserSerializer < ApplicationSerializer
	attributes :email
	has_many :companies
end