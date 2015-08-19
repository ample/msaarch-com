server '52.20.190.233', user: 'ubuntu', roles: %w{app db web}
set :deploy_to, '/home/ubuntu/sites/msaarch-com'
set :rails_env, 'production'
set :pty, false
set :ssh_options, {
  forward_agent: true,
  auth_methods: ["publickey"],
  keys: [ENV['PEM']]
}
