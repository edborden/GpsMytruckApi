class ChangeDevicesIndexes < ActiveRecord::Migration
	def change
		change_table "devices" do |t|
			t.remove_index name: "index_devices_on_company_id_and_hardware_id"
			t.index "hardware_id"
		end
	end
end
