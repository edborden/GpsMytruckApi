class MessageController < ActionController::API
	include ActionController::HttpAuthentication::Basic::ControllerMethods

	http_basic_authenticate_with name: "1dcf512b009adf0e36b", password: "32be4c8e0d5df8f2d9faf6"

	def create
		puts params
		head :no_content
	end

end