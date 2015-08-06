require 'test_helper'
require 'geo_calc'

class GeoCalcTest < ActiveSupport::TestCase

	def setup
		@z1 = Location.create(lat:40.0001,lng:-74.0001)
		@z2 = Location.create(lat:40.0,lng:-74.0)
	end		

	test "distance" do
		assert_equal 14.00712,GeoCalc::distance(@z2.lat,@z2.lng,@z1.lat,@z1.lng).round(5)
	end

end