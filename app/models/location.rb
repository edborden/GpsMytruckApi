class Location < ActiveRecord::Base
	belongs_to :device

	def self.to_csv
		CSV.generate do |csv|
			csv << ['latitude','longitude','time']
			all.each do |location|
				csv << [location.lat,location.lng,location.time]
			end
		end
	end
end