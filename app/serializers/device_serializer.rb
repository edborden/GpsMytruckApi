class DeviceSerializer < ApplicationSerializer
	attributes :hardware_id,:truck_id,:locations_count
	has_one :company
end