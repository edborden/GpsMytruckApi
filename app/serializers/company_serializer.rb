class CompanySerializer < ApplicationSerializer
	attributes :name,:towbook,:audit
	has_one :user,embed: :ids,include:false
	has_many :devices
end