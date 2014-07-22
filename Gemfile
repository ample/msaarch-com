source 'http://rubygems.org'

gem 'rails', '~> 3.1'
gem 'sqlite3'
gem 'capistrano'
gem 'hoptoad_notifier'
gem 'jquery-rails'
gem 'will_paginate', '~> 3.0'
gem 'ample_admin', :path => File.join(File.dirname(__FILE__), '/vendor/gems/ample_admin')
gem 'pdfkit'
gem 'rails3-jquery-autocomplete'
gem 'aws-ses', '~> 0.4.3', :require => 'aws/ses'
gem 'twitter'
gem 'twitter-text'
gem 'formatize'
gem 'execjs', '1.4.0'

group :assets do
  gem 'sass-rails', '~> 3.1.0.rc'
  gem 'coffee-rails'
  gem 'uglifier'
  # gem 'compass', :git => 'https://github.com/chriseppstein/compass.git', :branch => 'rails31'
  gem "compass-rails", "~> 1.0.3"
end

group :production do
  gem 'mysql2'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda', '3.0.1'
  gem 'turn', :require => false
  gem 'minitest'
  gem 'spin', '~> 0.2.1'
  gem 'guard-spin'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'
end
