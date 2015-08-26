require 'open-uri'
require 'cgi'

class HosHandler
	include Handler

	def initialize
		@partner_id = "1210"
		@user = "gpsmytruck1"
		@pass = "M@k31tGo"
	end

	def post hardware_id,lat,lng,time,event_name,distance_traveled

		time = time[0,19] + "Z" unless time.nil?

		#p time

		queryString = "?p1=" + CGI.escape("{#{@user}}") + "&p2=" + CGI.escape("{#{@pass}}") + "&p3=" + CGI.escape("{#{@partner_id}}") + "&p4=" + CGI.escape("{#{hardware_id}}") + "&p5=" + CGI.escape("{#{time}}") + "&p6=" + CGI.escape("{#{lat}}") + "&p7=" + CGI.escape("{#{lng}}") + "&p8=" + CGI.escape("{}") + "&p9=" + CGI.escape("{#{event_name}}") + "&p10=" + CGI.escape("{#{distance_traveled}}") + "&p11=" + CGI.escape("{}") + "&p12=" + CGI.escape("{}") + "&p13=" + CGI.escape("{}")

		uri = URI.parse 'https://atsdriver.infopowerapps.com/atsrs/Svc1.svc/GPSReceive' + queryString

		response = open uri

		#puts response.read()

	end

end