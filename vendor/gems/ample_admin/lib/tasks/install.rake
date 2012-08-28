require File.expand_path('../../ample_admin/tasks/install', __FILE__)

namespace :ample_admin do

  desc "Install ample_admin"
  task :install do
    AmpleAdmin::Tasks::Install.run(ENV['model_name'] || 'user')
  end

end