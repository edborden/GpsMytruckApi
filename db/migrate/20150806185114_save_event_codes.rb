class SaveEventCodes < ActiveRecord::Migration
  def change

	change_table :locations do |t|
		t.integer "event_code"
	end

	change_column :locations, :distance_traveled, :decimal, precision:10,scale: 3, default: 0.0
	change_column :locations, :lat, 'decimal USING CAST(lat AS decimal)', precision: 8, scale: 6
	change_column :locations, :lng, 'decimal USING CAST(lng AS decimal)', precision: 9, scale: 6


  end
end
