Rails.application.routes.draw do
  resources :contracts 

  get 'pages/home'
  root 'pages#home'

end
