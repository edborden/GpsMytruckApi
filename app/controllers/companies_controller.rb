class CompaniesController < ResourceController

	def resource_params
		params.require(:company).permit :name,:user_id
	end

end
