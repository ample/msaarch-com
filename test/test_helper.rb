ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'devise/test_helpers'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def create_asset
    attrs = { :attachment => File.read("#{Rails.root}/app/assets/images/rails.png") }
    Asset.create attrs
  end

  def create_user(opts={})
    attrs = { :first_name => 'Taylor', :last_name => 'MacDonald', :email => 'taylor@helloample.com', :password => 'ample2012' }.merge(opts)
    User.create attrs
  end

end

# Transactional fixtures do not work with Selenium tests, because Capybara
# uses a separate server thread, which the transactions would be hidden
# from. We hence use DatabaseCleaner to truncate our test database.
DatabaseCleaner.strategy = :truncation

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  Capybara.javascript_driver = :webkit
  
  # Tell Warden that we're testing
  include Warden::Test::Helpers
  Warden.test_mode!
  
  # Stop ActiveRecord from wrapping tests in transactions
  self.use_transactional_fixtures = false
  
  # Use as needed to select webkit
  # setup do
  #   Capybara.current_driver = Capybara.javascript_driver # :selenium by default
  # end

  teardown do
    DatabaseCleaner.clean       # Truncate the database
    Capybara.reset_sessions!    # Forget the (simulated) browser state
    Warden.test_reset!          # Forget the user state
    Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
  end
  
end
