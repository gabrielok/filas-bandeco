Rails.application.routes.draw do
  get 'restaurants/new'

  root 'application#homepage'
  resources :test
end
