require 'rails/generators'
require 'rails/generators/migration'
require File.expand_path('../utils', __FILE__)

module AmpleAdmin
  class InstallInitializerGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)
    desc "AmpleAdmin initializer Install"

    def create_migration_file
      copy_file 'initializer.rb', 'config/initializers/ample_admin.rb'
    end
  end
end