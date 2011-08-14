Comics::Application.routes.draw do |map|
  root :to => "comics#index"
  resources :comics

  match '/all' => 'comics#all'
end
