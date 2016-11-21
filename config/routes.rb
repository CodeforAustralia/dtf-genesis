Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :csr_performance_reports
  resources :cpr_performance_reports
  
  get '/contracts/search', to: 'contracts#search'
  get '/contracts/save', to: 'contracts#save'

  get '/suppliers/search', to: 'suppliers#search'
  get '/suppliers/save', to: 'suppliers#save'

  resources :suppliers
  resources :contracts
  resources :councils

  get 'pages/home'
  get 'pages/about'
  root 'pages#home'
end
