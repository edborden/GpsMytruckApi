# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Rails.logger = Le.new('1bbb565b-4d09-45ab-8a83-1e5fd663e944', :debug => true, :local => true)