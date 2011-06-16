module AmpleAdmin
  class Engine < Rails::Engine

    config.mount_at = '/admin/'
    # config.action_view.javascript_expansions[:defaults] = ['/admin/javascripts/libs/jquery.min.js','/admin/javascripts/plugins/jquery-ui.min.js','/admin/javascripts/rails']    
    # config.nav_positions = [ ['Hidden', ''], ['Visible', 'visible'] ]
    
  end
end
