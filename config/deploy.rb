set :application, 'comical'
set :repository, 'git@github.com:brettbuddin/comical.git'
set :scm, 'git'
set :branch, 'master'
role :web, 'intraspirit.net'
role :app, 'intraspirit.net'
role :db, 'intraspirit.net', :primary => true

set :user, 'brett'

set :deploy_to, '/home/brett/web/comicstripfix.com/deploy'

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
