$LOAD_PATH.unshift File.join(FileUtils.pwd, 'lib')

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require 'migration_utils'

Dir["#{File.dirname(__FILE__)}/lib/tasks/*.rake" ].each{ |rake_file| load rake_file }