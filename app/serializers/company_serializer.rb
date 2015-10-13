class CompanySerializer < ApplicationSerializer
	attributes :name,:towbook,:audit,:email,:daily_report
	has_one :user,embed: :ids,include:false
	has_many :devices
end