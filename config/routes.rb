Rails.application.routes.draw do
  resources :suppliers
  resources :cpr_scores
  resources :cpr_reports
  get '/contracts/search', to: 'contracts#search'
  get '/contracts/save', to: 'contracts#save'

  resources :contracts
  resources :councils 

  get 'pages/home'
  get 'pages/about'
  root 'pages#home'
end
