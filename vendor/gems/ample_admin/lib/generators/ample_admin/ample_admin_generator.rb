module RailsAdmin
  class RailsAdminGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    namespace "ample_admin"

    def print_instructions
      puts "AmpleAdmin!

Hello, to install ample_admin into your app you need to run:

\trake ample_admin:install

By default AmpleAdmin works with Devise to provide authentication. If you use
Devise, but want use another model than the default 'user' you can provide the
custom model name as an argument:

\trake ample_admin:install model_name=member

"
    end

  end
end