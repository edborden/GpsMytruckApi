class TotalMileageReport

	def initialize locations
		@locations = locations
	end

	def run
		last_location = nil
		total_meters = 0
		@locations.find_each_with_order do |location|
			if location.lat && location.lng
				if last_location
					distance = LocationDistance.new(last_location,location).in_meters
					total_meters += distance
				end
				last_location = location
			end
		end
		total_miles = GeoCalc::meters_to_miles(total_meters)
		total_miles.round(2)
	end

end