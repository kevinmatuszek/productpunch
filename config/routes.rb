Rails.application.routes.draw do
  devise_for :users
  resources :punches do
  	member do
  		put "like", to: "punches#upvote"
  	end
  end
  
  root 'punches#index'
end
