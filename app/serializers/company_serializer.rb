class CompanySerializer < ApplicationSerializer
	attributes :name
	has_one :user
end