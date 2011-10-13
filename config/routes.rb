Comics::Application.routes.draw do
  root :to => "comics#index"
  resources :comics

  match '/all' => 'comics#all'
end
