require './config/boot'
require 'hoptoad_notifier/capistrano'
require 'bundler/capistrano'

set :application, 'msaarch'
set :deploy_via,   :remote_cache
set :scm,          :git
set :git_enable_submodules, 1
set :keep_releases, 4
default_run_options[:pty] = true

set :dest, Capistrano::CLI.ui.ask("dev - Development\nwww - Production\nDestination: ")

# Rackspace options
set :branch,       'master'
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

# Deploy options  
role :app, host
role :web, host
role :db,  host, :primary => true