Rails.application.routes.draw do
  
  root 'pages#home'
    
  get '/home', to: 'pages#home'                                                 #typing in web address/home will take you to a pages controller and home action. controller#action
  
  #get '/recipes', to: 'recipes#index'
  #get 'recipes/new', to: 'recipes#new', as: 'new_recipe'                        
  #post '/recipes', to: 'recipes#create'                                         #http post request to recipes, handle using create action in recipes controller
  #get 'recipes:id/edit', to: 'recipes#edit', as: 'edit_recipe'                  
  #patch '/recipes/:id', to: 'recipes#update'
  #get 'recipes/:id', to: 'recipes#show', as: 'recipe'
  #delete '/recipes/:id', to: 'recipes#destroy'
  
  resources :recipes
  
end
