class Device < ActiveRecord::Base
	belongs_to :company
	has_many :locations, dependent: :destroy
end