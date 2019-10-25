Rails.application.routes.draw do
  get 'welcome/index'
  root to: 'welcome#index'
  
	resources :articles do
	  resources :comments
	  get 'preview', on: :new
	end
	resources :posts
	resources :users
	resources :patients
	get 'photos', to: 'users#photos'
	
#	get "posts/download_pdf", to: "posts#download_pdf"
#	get 'username/exit', to: 'users#destroy', as: :logout
  	
	
end





