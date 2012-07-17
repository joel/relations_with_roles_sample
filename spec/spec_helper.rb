require 'rubygems'
require 'spork'

ENV["RAILS_ENV"] ||= 'test'

Spork.prefork do
  require 'rails/application'
  Spork.trap_method(Rails::Application, :reload_routes!)
  
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'factory_girl'
  require 'database_cleaner'

  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  RSpec.configure do |config|
    config.mock_with :rspec
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run :focused => true
    config.run_all_when_everything_filtered = true
  end

  RSpec.configuration.after(:each, :type => :acceptance) do
    Capybara.reset_sessions!
  end

  # RSpec.configuration.before(:each) do
  #   Timecop.return
  # end
end

Spork.each_run do
  Dir["#{Rails.root}/app/models/*.rb"].each { |model| load model }
end
