class TotalMileageReport

	def initialize locations
		@locations = locations
	end

	def run
		last_location = nil
		total_m = 0
		@locations.find_each do |location|
			if last_location
				distance = distance_locations(last_location,location)
				total_m += distance
			end
			last_location = location
		end
		total_miles = GeoCalc::km_to_m(total_m*1000)
	end

	def distance_locations loc1,loc2
		GeoCalc::distance loc1.lat.to_f,loc1.lng.to_f,loc2.lat.to_f,loc2.lng.to_f
	end

end