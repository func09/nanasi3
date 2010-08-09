set :rails_env, :production
set :application, "nanasi3"
set :repository,  'git://github.com/func09/nanasi3.git'

set :scm, :git
set :user, "app"
set :use_sudo, false
set :branch, "master"
set :deploy_via, :copy
set :deploy_to, "/home/app/deploy/#{application}"

role :web, "nanasi3.com"                          # Your HTTP server, Apache/etc
role :app, "nanasi3.com"                          # This may be the same as your `Web` server
role :db,  "nanasi3.com", :primary => true # This is where Rails migrations will run

set :unicorn_binary, "/usr/bin/unicorn_rails"
set :unicorn_config, "#{current_path}/config/unicorn.rb"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"

namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do 
    run "cd #{current_path} && #{try_sudo} #{unicorn_binary} -c #{unicorn_config} -E #{rails_env} -D"
  end
  task :stop, :roles => :app, :except => { :no_release => true } do 
    run "#{try_sudo} kill `cat #{unicorn_pid}`"
  end
  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s QUIT `cat #{unicorn_pid}`"
  end
  task :reload, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s USR2 `cat #{unicorn_pid}`"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end
end

after 'deploy:finalize_update' do
  run "cd #{latest_release} && bundle install #{shared_path}/vendor --without development,test && bundle lock"
end

