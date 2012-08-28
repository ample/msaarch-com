require 'rails/generators'
require 'rails/generators/migration'
require File.expand_path('../utils', __FILE__)

module AmpleAdmin
  class InstallMigrationsGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)
    class << self
      include Generators::Utils
    end

    desc "AmpleAdmin migrations Install"

    def create_migration_file
      migration_template 'migration.rb', 'db/migrate/create_ample_admin_tables.rb' rescue p $!.message
    end
  end
end