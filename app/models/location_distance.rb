class LocationDistance
	attr_accessor :in_meters

	def initialize location1,location2
		@location1 = location1
		@location2 = location2
		@in_meters = GeoCalc::distance(location1.lat,location1.lng,location2.lat,location2.lng)
	end

	def in_miles
		@in_miles ||= @in_meters * 0.000621371
	end

end