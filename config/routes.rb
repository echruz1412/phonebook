Rails.application.routes.draw do
  devise_for :users

  resources :members
  resources :contacts do
  	resources :phones
  	resources :alamats
  end

  root to: 'phonebook#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
