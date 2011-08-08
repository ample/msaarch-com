source 'http://rubygems.org'

group :production do
  gem 'mysql2'
end

gem 'rails', :git => 'https://github.com/rails/rails.git', :branch => '3-1-stable'
gem 'sqlite3'
gem 'capistrano'
gem 'hoptoad_notifier'

# Asset template engines
gem 'sass', '3.1.5'
gem 'coffee-script'
gem 'uglifier'

gem 'jquery-rails'
gem 'will_paginate', :path => File.join(File.dirname(__FILE__), '/vendor/gems/will_paginate')
gem 'ample_admin', :path => File.join(File.dirname(__FILE__), '/vendor/gems/ample_admin')

group :assets do
  gem 'sass-rails', :git => 'https://github.com/rails/sass-rails.git', :branch => '3-1-stable'
  # others removed for simplicity
end

group :test do
  gem 'turn', :require => false
end
