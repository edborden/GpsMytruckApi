class RemoveIndex < ActiveRecord::Migration
  def change
  	remove_index :locations, :device_id
  end
end
