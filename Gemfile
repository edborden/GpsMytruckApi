source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '4.2.3'
gem 'rails-api', "0.4.0"
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
gem 'pg'
gem 'rack-cors', require: 'rack/cors'
#gem 'bcrypt'
gem 'active_model_serializers',"0.8.3"
gem 'httparty'
gem 'ar-find-in-batches-with-order'

## Ironworker
gem "iron_worker"
gem "iron_worker_ng"

## EMAIL
gem 'mandrill_mailer'

group :test do
	gem "faker"
	gem "shoulda"
	gem "database_cleaner"
end

group :development,:test do
	gem 'rspec-rails'
	gem 'factory_girl_rails'
end

group :production do
	#gem 'le'
	gem 'rails_12factor'
	gem 'newrelic_rpm'
	gem 'unicorn', platforms: :ruby
end