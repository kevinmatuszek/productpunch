Rails.application.routes.draw do
  devise_for :users
  resources :punches
  
  root 'punches#index'
end
