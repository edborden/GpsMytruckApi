class TotalMileageReport

	def initialize locations
		@locations = locations
	end

	def run
		last_location = nil
		total_miles = 0

		if @locations.count > 999
			@locations.find_each_with_order do |location|
				if last_location
					distance = LocationDistance.new(last_location,location).in_miles
					total_miles += distance
				end
				last_location = location
			end
		else
			@locations.each do |location|
				if last_location
					distance = LocationDistance.new(last_location,location).in_miles
					total_miles += distance
				end
				last_location = location
			end
		end

		total_miles.round(3)
	end

end