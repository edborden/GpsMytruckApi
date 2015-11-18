class MessageController < ApplicationController
	include ActionController::HttpAuthentication::Basic::ControllerMethods
	http_basic_authenticate_with name: "1dcf512b009adf0e36b", password: "32be4c8e0d5df8f2d9faf6"

	def create

		hardware_id = params[:data][:device_name]
		lat = params[:data][:gps_latitude]
		lng = params[:data][:gps_longitude]
		time = Moment.new(params[:data][:event_timestamp]).to_ruby
		event_code = params[:data][:event_code].to_i
		gps_speed = params[:data][:gps_speed].to_f

		device = Device.find_by hardware_id: hardware_id

		if device

			company = device.company
			location = Location.new lat:lat,lng:lng,time:time,device_id:device.id,event_code:event_code

			if location.valid?

				#if company.towbook
					#TowbookHandler.new.post hardware_id,lat,lng,time
					#IronWorkerHandler.new.handle :task,"towbook", {hardware_id:hardware_id,lat:lat,lng:lng,time:time}
				#end

				if company.audit

					location.set_distance_traveled
					push_to_hos = device.hos || ["357330051149722","357330051056018","352648068890763","352648067497321","358901048271875","358901048809716","358901048164138","358901048638008"].include?(hardware_id)

					location.save unless device.locations.exists? #initialize first location for device

					if device.driving

						if device.should_stop_driving?(location) || event_code == 15 #ignition off

							device.set_not_driving 
							event_name = "Travel Stop"

						else

							event_name = "Drive"

						end

						HosHandler.new.post hardware_id,lat,lng,params[:data][:event_timestamp],event_name,location.distance_traveled if push_to_hos
						location.save

					else

						if event_code == 45 && gps_speed > 30 && device.should_start_driving?(location)

							location.save
							device.set_driving
							HosHandler.new.post hardware_id,lat,lng,params[:data][:event_timestamp],"Travel Start",location.distance_traveled if push_to_hos

						end

					end

				end

			end

		end
		head :no_content
	end

end