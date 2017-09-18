require 'net/ssh/proxy/command'

set :ssh_options, {
  user: 'yushiro',
  forward_agent: true,
  auth_methods: %w(publickey),
  #proxy: Net::SSH::Proxy::Command::new("ssh gateway.stmn.co.jp -p 50022 -qW %h:%p")
}
