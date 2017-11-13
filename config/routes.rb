Rails.application.routes.draw do
  resources :users
  resources :restaurants
  root 'application#homepage'
  get 'restaurants/info/:id', to: 'restaurants#info'
end
