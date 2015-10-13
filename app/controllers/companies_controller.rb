class CompaniesController < ResourceController

	def resource_params
		params.require(:company).permit :name,:user_id,:towbook,:audit,:email,:daily_report
	end

end