server '13.113.11.189', user: 'daichi', roles: %w[app db web]

set :ssh_options, keys: '~/.ssh/kokoita_key_rsa'
