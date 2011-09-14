source 'http://rubygems.org'

gem 'rails', :git => 'https://github.com/rails/rails.git', :branch => '3-1-stable'
gem 'sqlite3'
gem 'capistrano'
gem 'hoptoad_notifier'
gem 'jquery-rails'
gem 'will_paginate', :path => File.join(File.dirname(__FILE__), '/vendor/gems/will_paginate')
gem 'ample_admin', :path => File.join(File.dirname(__FILE__), '/vendor/gems/ample_admin')
gem 'pdfkit'
gem 'rails3-jquery-autocomplete'

group :assets do
  gem 'sass-rails', '~> 3.1.0.rc'
  gem 'coffee-rails', '~> 3.1.0.rc'
  gem 'uglifier'
  gem 'compass', :git => 'https://github.com/chriseppstein/compass.git', :branch => 'rails31'
end

group :production do 
  gem 'mysql2'
end

group :test do
  gem 'turn', :require => false
end
