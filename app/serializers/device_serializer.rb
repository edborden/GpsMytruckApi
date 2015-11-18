class DeviceSerializer < ActiveModel::Serializer
	attributes :id,:hardware_id,:truck_id,:locations_count,:hos
	has_one :company, embed: :ids, include: false
end