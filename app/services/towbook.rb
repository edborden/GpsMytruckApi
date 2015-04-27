class Towbook

	def initialize
		@key = "00e22f1ff22b4576b04320f762b8d51b81944804b68b4c2aa12c8cfb07302125"
	end

	def post #hardwareId,lat,lng,time

		options = {
			query: {
				companyId: 2,
				deviceId: '123456789',
				latitude: 42.820026,
				longitude: -82.50398,
				timestamp: "2015-04-23T09:17:29.83"
			},
			headers: {
				"Content-Type" => "text/json",
				"X-Api-Token" => @key
			}			
		}

		HTTParty.post 'https://api.towbook.com/externallocation', options

	end
end