class LocationNulls < ActiveRecord::Migration
	def change

		change_column_null :locations, :lat, false
		change_column_null :locations, :lng, false
		change_column_null :locations, :device_id, false
		change_column_null :locations, :time, false

		add_index "locations", ["device_id"], name: "index_locations_on_device_id", using: :btree

	end
end
