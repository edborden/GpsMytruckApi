source 'https://rubygems.org'

gem 'rails', '4.1.9'
gem 'rails-api', "0.4.0"
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
gem 'pg'
gem 'rack-cors', require: 'rack/cors'
gem 'bcrypt'
gem 'active_model_serializers',"0.8.3"
gem 'httparty'
gem 'ar-find-in-batches-with-order'
gem 'le'

group :test do
	gem 'mocha', "~> 1.0.0"
	gem "faker"
end

group :production do
	gem 'rails_12factor'
	#gem 'newrelic_rpm'
	gem 'unicorn', platforms: :ruby
end