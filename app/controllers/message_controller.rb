class MessageController < ApplicationController
	include ActionController::HttpAuthentication::Basic::ControllerMethods
	http_basic_authenticate_with name: "1dcf512b009adf0e36b", password: "32be4c8e0d5df8f2d9faf6"

	def create

		hardware_id = params[:data][:device_name]
		lat = params[:data][:gps_latitude]
		lng = params[:data][:gps_longitude]
		time = Moment.new(params[:data][:event_timestamp]).to_ruby
		event_code = params[:data][:event_code].to_i

		device = Device.find_by hardware_id: hardware_id

		if device

			company = device.company

			if company.towbook
				Towbook.new.post hardware_id,lat,lng,time
			end

			if company.audit
				distance_traveled = 0
				last_device_location = device.locations.order(:time).last
				if last_device_location
					distance_traveled = GeoCalc::distance last_device_location.lat.to_f,last_device_location.lng.to_f,lat.to_f,lng.to_f
					unless distance_traveled > 0
						Location.create lat:lat,lng:lng,time:time,device_id:device.id,distance_traveled:distance_traveled
					end
				else
					Location.create lat:lat,lng:lng,time:time,device_id:device.id,distance_traveled:distance_traveled
				end

				push_to_hos = hardware_id == "357330051149722" || hardware_id == "357330051056018" || hardware_id == "352648068890763" || hardware_id == "352648067497321"
				puts "push_to_hos"
				puts push_to_hos
				hos_event = event_code == 33 || event_code == 35 || event_code == 3
				puts "hos_event"
				puts hos_event
				if push_to_hos && hos_event
					puts event_code
					puts device.driving
					unless event_code == 3 && !device.driving
						Hos.new.post hardware_id,lat,lng,time,event_code,distance_traveled
					end
				end

				case event_code
				when 33
					device.set_driving
				when 35
					device.set_not_driving
				end

			end

		end
		head :no_content
	end

end