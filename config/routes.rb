Rails.application.routes.draw do
  root 'application#homepage'
  resources :test
end
