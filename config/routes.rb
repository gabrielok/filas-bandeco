Rails.application.routes.draw do
  resources :users
  resources :restaurants
  # get 'restaurants/:id', to: 'restaurants#show' está incluso
  root 'application#homepage'
  get '/nusp' => 'application#nusp'
  get 'restaurants/info/:id' => 'restaurants#info'
  get 'users/:id/exit' => 'users#update'
  delete 'users' => 'users#destroy'
end
