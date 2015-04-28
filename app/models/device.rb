class Device < ActiveRecord::Base
	belongs_to :company
	has_many :locations
end