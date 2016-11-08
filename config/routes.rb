Rails.application.routes.draw do
  get '/contracts/search', to: 'contracts#search'
  resources :contracts
  resources :councils 

  get 'pages/home'
  get 'pages/about'
  
  root 'pages#home'

end
