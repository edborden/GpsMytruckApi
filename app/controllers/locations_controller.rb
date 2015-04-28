class LocationsController < AuthenticatedController
	include ActionController::MimeResponds

	def index

		device = Device.find params[:device_id]
		locations = device.locations

		respond_to do |format|

			format.csv do
				csv = locations.to_csv
				send_data csv, filename: "#{device.hardware_id}.csv", type: "application/csv"
			end

		end

	end

end
