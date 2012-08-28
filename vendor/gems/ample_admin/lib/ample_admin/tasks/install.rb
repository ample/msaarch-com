require 'rails/generators'

module AmpleAdmin
  module Tasks
    class Install
      class << self

        def run(model_name = 'user')
          @@model_name = model_name
          puts "\nHello!\nAmpleAdmin works with Devise. Checking for a current installation of Devise...\n"
          if defined?(Devise)
            check_for_devise_models
          else
            puts "Please put gem 'devise' into your Gemfile\n\n"
          end

          puts "Also you need a new migration. We'll generate it for you now...\n"
          `rails g ample_admin:install_migrations`

          puts "And lastly, you'll need an initializer. Creating that now...\n"
          `rails g ample_admin:install_initializer`

          puts "Donezo.\n\n"
        end  

        def create_initializer
          print "Now creating ample_admin initializer... "
          origin = File.join(gem_path, 'public')
          destination = Rails.root.join('public')
          puts copy_files(%w( stylesheets images javascripts ), origin, destination)
        end

        def copy_assets_files
          print "Now copying assets files - javascripts, stylesheets and images... "
          origin = File.join(gem_path, 'public')
          destination = Rails.root.join('public')
          puts copy_files(%w( stylesheets images javascripts ), origin, destination)
        end

        def copy_view_files
          print "Now copying view files... "
          origin = File.join(gem_path, 'app/views')
          destination = Rails.root.join('app/views')
          puts copy_files(%w( layouts . ), origin, destination)
        end

        private

          def copy_files(directories, origin, destination)
            directories.each do |directory|
              Dir[File.join(origin, directory, 'ample_admin', '**/*')].each do |file|
                relative  = file.gsub(/^#{origin}\//, '')
                dest_file = File.join(destination, relative)
                dest_dir  = File.dirname(dest_file)
                if !File.exist?(dest_dir)
                  FileUtils.mkdir_p(dest_dir)
                end
                copier.copy_file(file, dest_file) unless File.directory?(file)
              end
            end
          end

          def check_for_devise_models
            devise_path = Rails.root.join("config/initializers/devise.rb")
            if File.exists?(devise_path)
              parse_route_files
            else
              puts "Looks like you don't have devise installed yet.\n"
              `rails g devise:install`
              set_devise
            end
          end

          def parse_route_files
            routes_path = Rails.root.join("config/routes.rb")
            content = ""
            File.readlines(routes_path).each{|line| content += line }
            unless content.index("devise_for").nil?
              # there is a devise_for in routes => Do nothing
              puts "Great! You have devise installed and setup!\n\n"
            else
              puts "Great you have devise installed, but not set up!\n"
              set_devise
            end
          end

          def set_devise
            puts "Setting up devise...\n======================================================\n"
            `rails g devise #{@@model_name}`
          end

          def copier
            unless @copier
              Rails::Generators::Base.source_root(gem_path)
              @copier = Rails::Generators::Base.new
            end
            @copier
          end

      end
    end
  end
end