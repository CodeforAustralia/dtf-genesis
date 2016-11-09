Rails.application.routes.draw do
  get '/contracts/search', to: 'contracts#search'
  get '/contracts/save', to: 'contracts#save'

  resources :contracts
  resources :councils 

  get 'pages/home'
  get 'pages/about'
  root 'pages#home'
end
