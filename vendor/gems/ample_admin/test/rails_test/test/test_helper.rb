ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'devise/test_helpers'

class ActiveSupport::TestCase
  fixtures :all
end


class ActionController::IntegrationTest
  include Capybara::DSL
  include Warden::Test::Helpers
  include Rack::Test::Methods
  # Capybara.default_driver = :selenium
  self.use_transactional_fixtures = false

  def confirm_dialog
    a = page.driver.browser.switch_to.alert
    if a.text == 'OK'
      a.dismiss
    else
      a.accept
    end
  end

  def selenium?
    Capybara.default_driver == :selenium
  end
end