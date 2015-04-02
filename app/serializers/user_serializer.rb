class UserSerializer < ApplicationSerializer
	attributes :email
	has_many :companies, embed_in_root: true
end