require 'rails/generators'

module AmpleAdmin
  module Tasks
    class Uninstall
      class << self
        def run
          puts "uninstalling stuff"
        end  
      end
    end
  end
end