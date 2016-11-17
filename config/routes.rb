Rails.application.routes.draw do
  resources :csr_performance_reports
  resources :cpr_performance_reports
  resources :suppliers
  get '/contracts/search', to: 'contracts#search'
  get '/contracts/save', to: 'contracts#save'

  resources :contracts
  resources :councils

  get 'pages/home'
  get 'pages/about'
  root 'pages#home'
end
