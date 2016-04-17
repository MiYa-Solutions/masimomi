set :user, "masimomi"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

role :web, "192.168.1.99"                          # Your HTTP server, Apache/etc
role :app, "192.168.1.99"                          # This may be the same as your `Web` server
role :db,  "192.168.1.99", :primary => true # This is where Rails migrations will run

