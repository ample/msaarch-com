require File.expand_path('../../ample_admin/tasks/uninstall', __FILE__)

namespace :ample_admin do
  desc "Uninstall ample_admin"
  task :uninstall do
    RailsAdmin::Tasks::Uninstall.run
  end
end