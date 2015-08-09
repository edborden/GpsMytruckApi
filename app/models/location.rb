class Location < ActiveRecord::Base
	validates :lat, presence: true
	validates :lng, presence: true

	belongs_to :device, counter_cache: true

	def self.to_csv collection
		CSV.generate do |csv|
			collection.find_each_with_order do |location|
				csv << [location.device.truck_id,location.time,location.lat,location.lng]
			end
		end
	end
end