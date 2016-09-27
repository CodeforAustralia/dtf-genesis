Rails.application.routes.draw do
  resources :contracts 

  get 'pages/home'
  get 'pages/about'
  
  root 'pages#home'

end
