Rails.application.routes.draw do
  # created resource route from scaffolding
  # 'do' allows the routes for tasks to go through project route
  resources :projects do
  	resources :tasks do 
  		member do
  			#patch is the http request
  			patch :complete
  		end
  	  end
    end
 end
  