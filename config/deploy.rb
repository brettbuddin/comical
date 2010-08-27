default_environment['PATH'] = "/opt/ruby-enterprise-1.8.7-2010.02/bin:/usr/local/bin:$PATH"

set :application, 'comical'
set :repository, 'git@github.com:brettbuddin/comical.git'
set :scm, 'git'
set :branch, 'master'
role :web, 'intraspirit.net'
role :app, 'intraspirit.net'
role :db, 'intraspirit.net', :primary => true
set :rake, "/opt/ruby-enterprise-1.8.7-2010.02/bin/rake"

set :user, 'brett'

set :deploy_to, '/var/www/comicstripfix.com/deploy'
set :use_sudo, false

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
  
  namespace :feeds do
    desc "Update the feeds"
    task :update, :roles => :app do
      run "cd #{current_path} && rake feeds:update RAILS_ENV=production"
    end
  end
end

namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, 'vendor/bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end

  task :bundle_new_release, :roles => :app do
    bundler.create_symlink
    run "cd #{release_path} && bundle install --deployment"
  end
end
after 'deploy:update_code', 'bundler:bundle_new_release'
