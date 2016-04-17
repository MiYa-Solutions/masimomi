namespace :ssh do
  desc 'Setup sudo on the server'
  task :setup do
    template 'ssh/sshd_config.erb', '/tmp/sudoers'
    run "#{sudo} chmod 440 /tmp/sudoers"
    run "#{sudo} chown root:root /tmp/sudoers"
    run "#{sudo} mv /tmp/sudoers /etc"
  end

  after 'deploy:setup', 'sudoers:setup'
end