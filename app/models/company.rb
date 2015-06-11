class Company < ActiveRecord::Base
	belongs_to :user
	has_many :devices, dependent: :destroy
	has_one :session, as: :sessionable
end