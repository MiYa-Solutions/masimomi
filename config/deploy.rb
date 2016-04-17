require "bundler/capistrano"
require 'capistrano/rails'

load 'config/recipes/base'
load 'config/recipes/sudo'

set :application, "MasiMomi"

set :scm, 'git'
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "masimomi"
set :application, "masimomi"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

desc "Check that we can access everything"
task :check_write_permissions do
  on roles(:all) do |host|
    if test("[ -w #{fetch(:deploy_to)} ]")
      info "#{fetch(:deploy_to)} is writable on #{host}"
    else
      error "#{fetch(:deploy_to)} is not writable on #{host}"
    end
  end
end

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#
#   namespace :staging do
#     invoke 'ssh:setup'
#     invoke 'sudoers:setup'
#     invoke 'sudoers:install'
#   end
#
#   namespace :pi do
#
#   end
#
# end