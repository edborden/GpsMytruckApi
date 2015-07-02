require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		device = Device.create
		30.times do
			time = "2015-05-#{rand(1..30)}T19:15:07.884Z"
			Location.create device_id:device.id,time: Moment.new(time).to_ruby
		end
	end

	test "location orders by time with find_each" do
		device = Device.first
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

		assert error

		error = false
		location_before = nil

		device.locations.order(:time).find_each_with_order do |location|
			if location_before
				if location.time < location_before.time
					error = true
				end
			end
			location_before = location
			break if error
		end

		assert_not error,"Locations aren't in order"

		startTime = Moment.new("2015-05-05T19:15:07.884Z").to_ruby
		endTime = Moment.new("2015-05-10T19:15:07.884Z").to_ruby

		error = false
		location_before = nil

		device.locations.where(time: startTime..endTime).order(:time).find_each_with_order do |location|
			if location_before
				if location.time < location_before.time
					error = true
				end
			end
			location_before = location
			break if error
		end

		assert_not error		

	end

end