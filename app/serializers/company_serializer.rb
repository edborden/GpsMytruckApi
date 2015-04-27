class CompanySerializer < ApplicationSerializer
	attributes :name,:towbook,:audit
	has_one :user
	has_many :devices
end