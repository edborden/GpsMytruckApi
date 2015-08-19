describe Location do

	describe "db" do

		it { should have_db_column(:lat).with_options null:false }
		it { should have_db_column(:lng).with_options null:false }
		it { should have_db_column(:time).with_options null:false }
		it { should have_db_column(:device_id).with_options null:false }
		it { should have_db_column :event_code }

		it { should have_db_index :device_id }

	end

	describe "associations" do

		it { should belong_to(:device).counter_cache }

	end

	describe "validations" do

		it { should validate_presence_of :lat }
		it { should validate_presence_of :lng }
		it { should validate_presence_of :time }
		it { should validate_presence_of :device_id }

	end

	context "device with locations" do

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

end