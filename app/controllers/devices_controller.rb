class DevicesController < ResourceController

	def resource_params
		params.require(:device).permit :hardware_id,:company_id
	end

end
