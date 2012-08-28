require 'ample_admin'
require 'rails'
require 'devise'
require 'ample_admin/application_helper'
require 'ample_admin/augmentations'
require 'acts_as_indexed'
require 'rack/cache'
require 'will_paginate'
require 'dragonfly'

module AmpleAdmin
 class Engine < Rails::Engine

    engine_name :ample_admin

    config.model_name = 'user'
    config.mount_at = '/admin/'
    config.nav_positions = [ ['Hidden', ''], ['Header', 'header'], ['Footer', 'footer'] ]
    config.templates = { 
      :pages => { 
        :path => File.join(Engine.root, 'app', 'views', 'templates'), 
        :default => 'default' 
      }
    }

    initializer 'mount ample admin' do |app|

      # make sure mount_at ends with trailing slash
      config.mount_at += '/'  unless config.mount_at.last == '/'
  
      # Activate observers that should always be running
      # ActiveRecord::Base.observers = :user_observer

      # Serve static assets
      app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public" if Rails.env.development?

      # Configure ActsAsIndexed
      ::ActsAsIndexed.configure do |config|
        config.index_file = [Rails.root,'tmp','index']
      end

      # Configure Dragonfly
      dfly = Dragonfly[:images]
      dfly.configure_with(:imagemagick)
      dfly.configure_with(:rails)
      dfly.define_macro(ActiveRecord::Base, :image_accessor)
      dfly.register_mime_type(:swf, 'application/x-shockwave-flash')
      #dfly.url_format = '/media/:job/:basename.:format'
      #dfly.url_suffix = proc do |job|
      #  "/#{job.uid_basename}#{job.encoded_extname || job.uid_extname}"
      #end
      app.middleware.insert_after ::Rack::Cache, ::Dragonfly::Middleware, :images
      app.middleware.insert 0, ::Rack::Cache, {
        :verbose     => true,
        :metastore   => "file:#{Rails.root}/tmp/dragonfly/cache/meta",
        :entitystore => "file:#{Rails.root}/tmp/dragonfly/cache/body"
      }

      # Configure Devise
      ::Devise.setup do |devise|
        require 'devise/orm/active_record'
        config.encryptor = :bcrypt
        # TODO: This needs to be moved outta here
        config.pepper = '8f109c1ffbb6fad368128085ccb381eff08f6688a9abd9b2e7362c4b203ccbf20687972fd88657a5971ce3078754ba11bed80ee56560867dfe7a0c0548b64610'
      end

      # Configure Uploadify
      app.middleware.insert_before ::ActionDispatch::Session::CookieStore, FlashSessionCookieMiddleware, app.config.session_options[:key]
    end
    
  end
end
