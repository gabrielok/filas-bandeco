Rails.application.routes.draw do
  resources :restaurants
  # get 'restaurants/prefeitura'
  # get 'restaurants/fisica'
  # get 'restaurants/central'
  # get 'restaurants/quimica'
  root 'application#homepage'
end
