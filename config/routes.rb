Rails.application.routes.draw do
  resources :restaurants
  root 'application#homepage'
end
