class AddDailyReportToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :daily_report, :boolean
  end
end
