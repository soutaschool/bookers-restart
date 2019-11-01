Rails.application.routes.draw do

	root 'home#top'
	get 'home/about'
  devise_for :users
  resources :users,only: [:show,:edit,:update,:index]
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
