class Location < ActiveRecord::Base
	belongs_to :device

	def self.to_csv
		CSV.generate do |csv|
			all.each do |location|
				csv << [location.device.truck_id,location.lat,location.lng,location.time]
			end
		end
	end
end