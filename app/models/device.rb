class Device < ActiveRecord::Base
	belongs_to :company
	has_many :locations, -> {order(:time)}, dependent: :destroy
end