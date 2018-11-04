Rails.application.routes.draw do
  get 'dashboards/index'

  resources :todos
  devise_for :users
  resources :projects
  resources :roles
  resources :users
  resources :dashboard
  

  
 #authenticated :user do
   root to: "dashboard#index", as: :authenticated_root
  #end
   #root :to => 'dashboard#index'

  scope "/admin" do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
