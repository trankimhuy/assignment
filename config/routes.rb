Rails.application.routes.draw do
  resources :products
  resources :users

  root 'pages#index'

  get 'signup', 	 to: 'users#new', 				     as: 'signup'
  get 'login', 		 to: 'user_sessions#new', 		 as: 'login'
  post 'login', 	 to: 'user_sessions#create', 	 :via => :post
  delete 'logout', to: 'user_sessions#destroy',  as: 'logout'
end
