source 'http://rubygems.org'

gem 'rails', :git => 'git@github.com:rails/rails.git', :branch => '3-2-stable'
gem 'sqlite3'
gem 'capistrano'
gem 'hoptoad_notifier'
gem 'jquery-rails', '~> 1.0.19'
gem 'will_paginate', '~> 3.0'
gem 'ample_admin', :path => File.join(File.dirname(__FILE__), '/vendor/gems/ample_admin')
gem 'pdfkit'
gem 'rails3-jquery-autocomplete'
gem 'aws-ses', '~> 0.4.3', :require => 'aws/ses'
gem 'twitter'
gem 'twitter-text'
gem 'formatize'
gem 'execjs', '1.4.0'
gem 'i18n', '~> 0.6.11'
gem 'paper_trail', '~> 3.0.5'
gem 'acts_as_markup', '~> 2.0.2'

group :assets do
  gem 'sass-rails',   '~> 3.2.6'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier',     '>= 1.0.3'
  gem "compass-rails", "~> 1.0.3"
end

group :production do
  gem 'mysql2'
end

group :development, :test do
  gem 'pry-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda', '3.0.1'
  gem 'turn', :require => false
  gem 'test-unit'
  gem 'minitest'
  gem 'spin', '~> 0.2.1'
  gem 'guard-spin'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'
end
