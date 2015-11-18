describe Device do

	describe "db" do

		it { should have_db_column(:hardware_id).of_type(:string).with_options limit:255 }
		it { should have_db_column(:company_id).of_type :integer }
		it { should have_db_column(:truck_id).of_type(:string).with_options limit:255 }
		it { should have_db_column(:locations_count).of_type(:integer).with_options null:false, default:0 }
		it { should have_db_column(:driving).of_type(:boolean).with_options default:false }
		it { should have_db_column(:hos).of_type(:boolean).with_options default:false, null:false }

		it { should have_db_index :company_id }
		it { should have_db_index :hardware_id }

	end

	describe "associations" do

		it { should belong_to(:company) }
		it { should have_many(:locations).dependent(:destroy) }

	end
	
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