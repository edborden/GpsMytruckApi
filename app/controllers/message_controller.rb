class MessageController < ApplicationController
	include ActionController::HttpAuthentication::Basic::ControllerMethods
	http_basic_authenticate_with name: "1dcf512b009adf0e36b", password: "32be4c8e0d5df8f2d9faf6"

	def create

		hardware_id = params[:data][:device_name]
		lat = params[:data][:gps_latitude]
		lng = params[:data][:gps_longitude]
		time = Moment.new(params[:data][:event_timestamp]).to_ruby

		device = Device.find_by hardware_id: hardware_id

		if device

			company = device.company

			if company.towbook
				Towbook.new.post hardware_id,lat,lng,time
			end

			if company.audit
				last_device_location = device.locations.last
				unless last_device_location.lat == lat && last_device_location.lng == lng
					Location.create lat:lat,lng:lng,time:time,device_id:device.id
				end
			end

		end
		head :no_content
	end

end