class AddHosToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :hos, :boolean, default:false, null: false
  end
end
