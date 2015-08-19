class CompanyAuditDefault < ActiveRecord::Migration
	def change

		change_column_default(:companies, :audit, true)

	end
end
