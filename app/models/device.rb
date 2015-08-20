class Device < ActiveRecord::Base
	belongs_to :company
	has_many :locations, dependent: :destroy

	def set_driving
		self.driving = true
		save
	end

	def set_not_driving
		self.driving = false
		save
	end

	def should_stop_driving? location
		last_locations = locations.last(3)
		last_locations.push location
		TotalMileageReport.new(last_locations).run < 0.25
	end

	def should_start_driving? location
		last_location = locations.last
		distance = LocationDistance.new(location,last_location).in_miles
		distance > 0.25
	end

end