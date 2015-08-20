class AddBigIndex < ActiveRecord::Migration
	disable_ddl_transaction!
	def change
		add_index :locations, [:device_id,:time], algorithm: :concurrently
	end
end
