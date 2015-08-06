class Device < ActiveRecord::Base
	belongs_to :company
	has_many :locations, dependent: :destroy

	def set_driving
		self.driving = true
		save
	end

	def set_not_driving
		self.driving = false
		save
	end

	def last_10_codes
		array = []
		locations.order(:time).last(10).each { |loc| array.push loc.event_code}
		return array
	end

end