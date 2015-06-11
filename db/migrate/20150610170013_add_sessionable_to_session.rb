class AddSessionableToSession < ActiveRecord::Migration
	def change

		drop_table "sessions"

		create_table "sessions" do |t|
			t.string "token"
			t.integer "sessionable_id",null:false
			t.string "sessionable_type",null:false,limit:7
			t.index ["sessionable_id","sessionable_type"]
		end

	end
end
