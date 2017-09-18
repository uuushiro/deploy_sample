# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'sample_deploy'
set :repo_url, 'git@github.com:uuushiro/deploy_sample.git'
set :branch, ENV['BRANCH'] || "master"


set :rbenv_path, '/home/yushiro/.rbenv/'
set :rbenv_ruby, '2.3.1'
set :rbenv_type, :system

set :default_env, {
  path: '/usr/local/rbenv/plugins/ruby-build/bin:/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH',
  rbenv_root: '/usr/local/rbenv'
}

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'
set :deploy_to, "/var/www/#{fetch(:application)}"

# Default value for :scm is :git
set :scm, :git

set :pty, true
# Default value for :format is :airbrussh.
set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

# puma.rb の設定項目は、capistrano-puma が作成する
# https://github.com/seuros/capistrano-puma
# 設定を変更した際は、下記の設定更新とリスタートをすること
# bundle exec cap [env] puma:config; bundle exec cap [env] puma:phased-restart
set :puma_role, :web
set :puma_init_active_record, true
set :puma_conf, -> { File.join(shared_path, 'config','puma.rb') }
set :puma_workers, 2
set :puma_threads, %i(0 4)