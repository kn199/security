Rails.application.routes.draw do
  resource :sessions, only: %i[create new destroy]
  resources :posts, only: %i[create new index]
  resources :introductions, only: %i[index]
end
