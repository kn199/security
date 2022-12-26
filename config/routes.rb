Rails.application.routes.draw do
  resources :posts, only: %i[create show new index]
end
