require 'geo_calc'

describe GeoCalc do

	let(:location1) { create :location,lat:40.0001,lng:-74.0001 }
	let(:location2)	{ create :location,lat:40.0,lng:-74.0 }

	describe "#distance" do
		it { expect(GeoCalc::distance(location2.lat,location2.lng,location1.lat,location1.lng).round(5)).to eq 14.00712 }
	end

end