class Location < ActiveRecord::Base
	validates_presence_of :lat,:lng,:time,:device_id

	belongs_to :device, counter_cache: true

	def self.to_csv collection
		CSV.generate do |csv|
			collection.find_each_with_order do |location|
				csv << [location.device.truck_id,location.time,location.lat,location.lng]
			end
		end
	end

	def set_distance_traveled
		last_device_location = device.locations.order(:time).last
		if last_device_location
			distance_traveled = LocationDistance.new(last_device_location,self).in_miles
		else
			distance_traveled = 0
		end
		self.distance_traveled = distance_traveled
	end

end