Rails.application.routes.draw do
  resources :punches
  
  root 'punches#index'
end
