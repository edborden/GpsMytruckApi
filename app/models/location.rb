class Location < ActiveRecord::Base
	belongs_to :device, counter_cache: true

	def self.to_csv collection
		CSV.generate do |csv|
			collection.find_each do |location|
				csv << [location.device.truck_id,location.time,location.lat,location.lng,location.time]
			end
		end
	end
end