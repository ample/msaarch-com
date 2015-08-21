source 'http://rubygems.org'

gem 'rails', '~> 4.2.3'
gem 'sqlite3'
gem 'hoptoad_notifier'
gem 'jquery-rails' #, '~> 1.0.19'
gem 'will_paginate', '~> 3.0'
gem 'ample_admin', :path => File.join(File.dirname(__FILE__), '/vendor/gems/ample_admin')
gem 'pdfkit'
gem 'rails3-jquery-autocomplete'
gem 'aws-ses', '~> 0.4.3', :require => 'aws/ses'
gem 'twitter'
gem 'twitter-text'
gem 'formatize', :git => 'git@github.com:niklas/formatize.git'
gem 'execjs', '1.4.0'
gem 'i18n'
gem 'paper_trail', '~> 3.0.5'
gem 'acts_as_markup', '~> 2.0.2'
gem 'actionpack-page_caching'
gem 'rails-observers'
gem 'devise'
gem 'figaro'
gem 'responders', '~> 2.0'

gem 'sass-rails', '~> 4.0.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
#gem "compass-rails", "~> 1.0.3"

gem 'therubyracer', platforms: :ruby
gem 'turbolinks'

group :production do
  gem 'mysql2'
  gem 'unicorn'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'capistrano'
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'capistrano-rails'
  #gem 'capistrano3-unicorn'
  gem 'slackistrano', require: false
end

group :development, :test do
  gem 'pry-rails'
  gem 'minitest'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda', '3.0.1'
  gem 'test-unit'
  gem 'spin', '~> 0.2.1'
  gem 'guard-spin'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'
end
