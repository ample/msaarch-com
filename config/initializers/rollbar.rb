Rollbar.configure do |config|
  config.access_token = 'e677873f210b410ca84eb8860b036a80'
  if Rails.env.test? || Rails.env.development?
    config.enabled = false
  end
  config.exception_level_filters.merge!('ActiveRecord::RecordNotFound' => 'ignore')
  config.environment = ENV['ROLLBAR_ENV'].presence || Rails.env
end
