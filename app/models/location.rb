class Location < ActiveRecord::Base
	belongs_to :device, dependent: :destroy

	def self.to_csv collection
		CSV.generate do |csv|
			collection.find_each do |location|
				csv << [location.device.truck_id,location.lat,location.lng,location.time]
			end
		end
	end
end