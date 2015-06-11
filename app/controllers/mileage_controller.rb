class MileageController < AuthenticatedController

	def index

		device = Device.find params[:device_id]
		startTime = Moment.new(params[:start]).to_ruby
		endTime = Moment.new(params[:end]).to_ruby
		locations = device.locations.where(time: startTime..endTime)

		mileage = TotalMileageReport.new(locations).run

		render text: mileage

	end

end