class LocationsController < AuthenticatedController
	include ActionController::MimeResponds

	def index

		device = Device.find params[:device_id]
		startTime = Moment.new(params[:start]).to_ruby
		endTime = Moment.new(params[:end]).to_ruby
		locations = device.locations.where(time: startTime..endTime).order(time: :asc)

		respond_to do |format|

			format.csv do
				csv = Location.to_csv locations
				send_data csv, filename: "Truck #{device.truck_id}.csv", type: "application/csv"
			end

		end

	end

end