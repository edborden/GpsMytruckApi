describe MessageController do

	let(:device) { create :device }

	let(:body) {
		{
			data: {
				device_name: device.hardware_id,
				gps_latitude: Faker::Address.latitude,
				gps_longitude: Faker::Address.longitude,
				event_timestamp: "2015-04-30T19:15:07.884Z",
				event_code: 45,
				gps_speed: 35
			}
		}
	}

	describe "POST to #create" do

		context "with valid basic credentials" do

			let(:user) { '1dcf512b009adf0e36b' }
			let(:pw) { '32be4c8e0d5df8f2d9faf6' }

			before do 
				request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
				post :create, body
			end

			it { should respond_with :no_content }
			it {expect(Location.count).to eq 1 }

		end

	end

end