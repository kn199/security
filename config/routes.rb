Rails.application.routes.draw do
  resources :posts, only: %i[create new index]
end
