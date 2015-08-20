describe Device do
	
	describe "#should_start_driving?" do

		let(:device) { create :device,driving:false }
		
		before { create :location, lat:10,lng:10,device:device,time:(Time.now - 1.minute) }
		
		context "when locations under 0.25 mi" do

			let!(:current_location) { build :location, lat:10,lng:10,device:device,time:Time.now }

			it "returns false" do
				expect(device.should_start_driving? current_location).to be false
			end

		end

		context "when locations over 0.25 mi" do

			let!(:current_location) { build :location, lat:11,lng:11,device:device,time:Time.now }

			it "returns true" do
				expect(device.should_start_driving? current_location).to be true
			end

		end

	end

	describe "#should_stop_driving?" do

		let(:device) { create :device,driving:true }

		before do
			create :location, lat:10,lng:10,device:device,time: Time.now - 3.minutes 
			create :location, lat:10,lng:10,device:device,time: Time.now - 2.minutes 
			create :location, lat:10,lng:10,device:device,time: Time.now - 1.minutes 
		end

		context "when moved under 0.25 mi in past 3 minutes" do

			let(:location) { build :location, lat:10,lng:10,device:device,time:Time.now }

			it "returns true" do
				expect(device.should_stop_driving? location).to be true
			end

		end

		context "when moved over 0.25 mi in past 3 minutes" do

			let(:location) { build :location, lat:11,lng:11,device:device,time:Time.now }

			it "returns false" do
				expect(device.should_stop_driving? location).to be false
			end

		end

	end

end