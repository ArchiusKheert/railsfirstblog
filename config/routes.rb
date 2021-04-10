Rails.application.routes.draw do
  devise_for :users
  resources :stars
	get "home/index"
	get "articles/about"
  	root "stars#index"
	get "articles", to: "articles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
