class DeviceSerializer < ApplicationSerializer
	attributes :hardware_id
	has_one :company
end