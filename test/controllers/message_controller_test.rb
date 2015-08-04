require 'test_helper'

class MessageControllerTest < ActionController::TestCase

	def setup

		@body = {
			data: {
				device_name: "357330051149722",
				gps_latitude: Faker::Address.latitude,
				gps_longitude: Faker::Address.longitude,
				event_timestamp: "2015-04-30T19:15:07.884Z",
				event_code: 33
			}
		}

	end

	test "request" do

		user = '1dcf512b009adf0e36b'
		pw = '32be4c8e0d5df8f2d9faf6'
		request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)

		post :create, @body

	end

end