require 'httparty'

class TowbookHandler
	include Handler

	def initialize
		@key = "de60309eda4f4a529a56b7be755892eddd5ff06c22c548a2b8710113ca735d44"
	end

	def post hardware_id,lat,lng,time

		body = {
			companyId: 2,
			deviceId: hardware_id,
			latitude: lat,
			longitude: lng,
			timestamp: time
		}

		options = {
			body: body.to_json,
			headers: {
				"Content-Type" => "text/json",
				"X-Api-Token" => @key
			}			
		}

		HTTParty.post 'https://api.towbook.com/externallocation', options

	end
end