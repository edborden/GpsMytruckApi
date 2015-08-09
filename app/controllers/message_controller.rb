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
			location = Location.new lat:lat,lng:lng,time:time,device_id:device.id,event_code:event_code,distance_traveled:0

			if company.towbook
				TowbookHandler.new.post hardware_id,lat,lng,time
				#IronWorkerHandler.new.handle :task,"towbook", {hardware_id:hardware_id,lat:lat,lng:lng,time:time}
			end

			if company.audit

				last_device_location = device.locations.order(:time).last
				if last_device_location
					location.distance_traveled = LocationDistance.new(last_device_location,location).in_miles
				end

				location.save

				puts event_code,device.driving

				push_to_hos = hardware_id == "357330051149722" || hardware_id == "357330051056018" || hardware_id == "352648068890763" || hardware_id == "352648067497321"
				hos_event = event_code == 33 || event_code == 35 || event_code == 45 || event_code == 40 || event_code == 50
				if push_to_hos && hos_event
					unless event_code == 3 && !device.driving
						HosHandler.new.post hardware_id,lat,lng,params[:data][:event_timestamp],event_code,location.distance_traveled
						#IronWorkerHandler.new.handle :task,"hos",{hardware_id:hardware_id,lat:lat,lng:lng,time:params[:data][:event_timestamp],event_code:event_code,distance_traveled:location.distance_traveled}
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