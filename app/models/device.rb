class Device < ActiveRecord::Base
	belongs_to :company, dependent: :destroy
	has_many :locations
end