require 'dragonfly/rails/images'

module AmpleAdmin
  class Engine < Rails::Engine
    config.mount_at = '/admin'
    config.model_name = 'user'
  end
end