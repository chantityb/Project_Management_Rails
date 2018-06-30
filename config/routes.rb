Rails.application.routes.draw do
  # created resource route from scaffolding
  # 'do' allows the routes for tasks to go through project route
  resources :projects do
  	resources :tasks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
