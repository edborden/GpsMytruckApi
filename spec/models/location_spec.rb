require 'rails_helper'

describe Location do

	let(:device) { create :device_with_locations,locations_count:30 }

	describe "#find_each" do

		it "cannot order by time" do

			location_before = nil
			error = false

			device.locations.find_each do |location|
				if location_before
					if location.time < location_before.time
						error = true
					end
				end
				location_before = location
				break if error
			end

			expect(error).to be true

		end

	end

	describe "#find_each_with_order" do

		it "can order by time" do

			location_before = nil
			error = false

			device.locations.order(:time).find_each_with_order do |location|
				if location_before
					if location.time < location_before.time
						error = true
					end
				end
				location_before = location
				break if error
			end

			expect(error).to be false

		end	

	end

end