source 'http://rubygems.org'

group :production do
  gem 'mysql2'
end

gem 'rails', :git => 'https://github.com/rails/rails.git', :branch => '3-1-stable'
gem 'sqlite3'
gem 'capistrano'
gem 'hoptoad_notifier'

# Asset template engines
gem 'coffee-script'
gem 'uglifier'

gem 'jquery-rails'
gem 'will_paginate', :path => File.join(File.dirname(__FILE__), '/vendor/gems/will_paginate')
gem 'ample_admin', :path => File.join(File.dirname(__FILE__), '/vendor/gems/ample_admin')

group :assets do
  gem 'sass-rails',   :git => 'git://github.com/rails/sass-rails.git', :branch => '3-1-stable'
  gem 'coffee-rails', :git => 'git://github.com/rails/coffee-rails.git', :branch => '3-1-stable'
  gem 'uglifier'
end
gem 'sprockets', :git => 'git://github.com/sstephenson/sprockets.git'

group :test do
  gem 'turn', :require => false
end
