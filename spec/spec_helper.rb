require 'rubygems'
require 'spork'

ENV["RAILS_ENV"] ||= 'test'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  # This file is copied to spec/ when you run 'rails generate rspec:install'
  require 'rails/application'
  Spork.trap_method(Rails::Application, :reload_routes!)
  
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'factory_girl'
  require 'rspec/http'
  require 'database_cleaner'
  require "email_spec"
  require 'webmock/rspec'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  # Dir[Rails.root.join("spec/factories/**/*.rb")].each { |f| require f }
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  RSpec.configure do |config|
    config.mock_with :rspec
    config.include Devise::TestHelpers, :type => :controller
    config.include ControllerMacros,    :type => :controller
    
    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    # config.use_transactional_fixtures = true
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run :focused => true
    # config.alias_example_to :fit, :focused => true
    config.run_all_when_everything_filtered = true
  end

  RSpec.configuration.include Capybara::DSL,                      :type => :acceptance
  RSpec.configuration.include ActionController::RecordIdentifier, :type => :acceptance
  RSpec.configuration.include EmailSpec::Helpers,                 :type => :acceptance
  RSpec.configuration.include EmailSpec::Matchers,                :type => :acceptance

  RSpec.configuration.after(:each, :type => :acceptance) do
    Capybara.reset_sessions!
    reset_mailer
  end

  RSpec.configuration.before(:each) do
    Timecop.return
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  Dir["#{Rails.root}/app/models/*.rb"].each { |model| load model }
end
