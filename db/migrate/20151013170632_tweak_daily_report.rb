class TweakDailyReport < ActiveRecord::Migration
  def change
    Company.update_all daily_report: false
    change_column_default :companies, :daily_report, false
    change_column_null :companies, :daily_report, false
  end
end