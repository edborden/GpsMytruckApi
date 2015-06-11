class SessionSerializer < ApplicationSerializer
	attributes :token
	has_one :user
	has_one :company

	def user
		object.sessionable if object.sessionable.is_a? User
	end

	def company
		object.sessionable if object.sessionable.is_a? Company
	end

end