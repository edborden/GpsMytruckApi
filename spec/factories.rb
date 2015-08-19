FactoryGirl.define do

	factory :location do

		lat {Faker::Address.latitude}
		lng {Faker::Address.longitude}
		time { Moment.new("2015-05-#{rand(1..30)}T19:15:07.884Z").to_ruby }

		device

	end

	factory :device do

		hardware_id { Faker::Lorem.characters(10) }
		company

		factory :device_with_locations do

			transient { locations_count 5 }
			after(:create) do |device, evaluator|
				create_list(:location, evaluator.locations_count, device: device)
			end

		end

	end

	factory :company do

		name { Faker::Lorem.characters(10) }
		user

	end

	factory :user do

		email { Faker::Internet.email }

	end

end