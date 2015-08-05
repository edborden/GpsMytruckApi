class Hos

	def initialize
		@partner_id = "1210"
		@user = "gpsmytruck1"
		@pass = "M@k31tGo"
	end

	def post hardware_id,lat,lng,time,event_code,distance_traveled

		queryString = "?p1={#{@user}}&p2={#{@pass}}&p3={#{@partner_id}}&p4={#{hardware_id}}&p5={#{time}}&p6={#{lat}}&p7={#{lng}}&p8={#{event_code}}&p9={#{event_name(event_code)}}&p10={#{distance_traveled}}&p11={}&p12={}&p13={}"

		response = HTTParty.get 'https://atsdriverdev.abw.com/atsrs/Svc1.svc/GPSReceive' + queryString

		puts response.body

	end

	def event_name event_code
		case event_code
		when 33
			"Travel Start"
		when 35,50
			"Travel Stop"
		when 3
			"Drive"
		end
	end
end