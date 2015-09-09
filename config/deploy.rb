# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'msaarch-com'
set :repo_url, 'git@github.com:ample/msaarch-com.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :deploy_via, :remote_cache
set :bundle_flags, "--quiet --no-cache"
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/application.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :rbenv_type, :user
set :rbenv_ruby, '2.2.2'

set :slack_webhook, "https://hooks.slack.com/services/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"
set :slack_icon_emoji,       -> { ':rocket:' }
set :slack_channel,          -> { '#ops' }
set :slack_username,         -> { 'tcmacdonald' }
set :slack_run_starting,     -> { true }
set :slack_run_finished,     -> { true }
set :slack_run_failed,       -> { true }


namespace :deploy do
  task :restart_unicorn do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      execute "service unicorn_msa upgrade"
    end
  end
end

after 'deploy', 'deploy:restart_unicorn'
