class HoursOfService < ActiveRecord::Migration
	def change
		change_table :locations do |t|
			t.float "distance_traveled", scale: 5
		end

		change_table :devices do |t|
			t.boolean "driving", default:false
		end		

	end
end
