Rails.application.routes.draw do
  get 'region/get_city'

  resources :stores
  root "stores#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
