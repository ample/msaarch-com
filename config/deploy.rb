require './config/boot'
#require 'hoptoad_notifier/capistrano'
require 'bundler/capistrano'

set :application, 'msaarch'
set :deploy_via,   :remote_cache
set :scm,          :git
set :git_enable_submodules, 1
set :keep_releases, 4
default_run_options[:pty] = true

set :dest, Capistrano::CLI.ui.ask("dev - Development\nwww - Production\nDestination: ")
set :assets, Capistrano::CLI.ui.ask("y - Yes\nn - No\nPrecompile assets?")


# Rackspace options
set :branch,       ENV['BRANCH'] || 'master'
set :user,         'deploy'
set :group,        'wheel'
set :repository,   "git@github.com:ample/#{application}-com.git"
set :host,         '50.57.126.202'
set :use_sudo,     false
ssh_options[:port] = 30123

if dest == 'www'
  set :deploy_to,    "/home/#{user}/sites/#{application}.com"
  set :rails_env,    'production'
elsif dest == 'dev'
  set :deploy_to,    "/home/#{user}/sites/dev.#{application}.com"
  set :rails_env,    'staging'
end

after 'deploy:update_code', 'deploy:update_shared'
if assets == 'y'
  after 'deploy:update_code', 'deploy:precompile_assets'
end

# Deploy options  
role :app, host
role :web, host
role :db,  host, :primary => true

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc 'Hook up all of the shared content to the current release'
  task :update_shared, :roles => :app do
    # Dragonfly Rack::Cache files
    run "mkdir -p #{shared_path}/tmp/dragonfly && ln -nfs #{shared_path}/tmp/dragonfly #{release_path}/tmp/dragonfly"
    # Search Index files
    run "mkdir -p #{shared_path}/tmp/index && ln -nfs #{shared_path}/tmp/index #{release_path}/tmp/index"
    # Copy in db config
    run "cp #{shared_path}/config/database.yml #{release_path}/config/"
  end

  desc 'Precompile assets'
  task :precompile_assets, :roles => :app do
    run "cd #{release_path} && bundle exec rake assets:precompile RAILS_ENV=#{rails_env}"
  end

end

require './config/boot'
require 'hoptoad_notifier/capistrano'
