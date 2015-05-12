class DeviceSerializer < ApplicationSerializer
	attributes :hardware_id,:truck_id
	has_one :company
end