require 'dragonfly/rails/images'

module AmpleAdmin
  class Engine < Rails::Engine
    config.mount_at = '/admin'
    config.model_name = 'user'
    config.templates = { 
      :pages => { :path => Rails.root.join('app', 'views', 'templates'), :default => 'default' }
    }
  end
end