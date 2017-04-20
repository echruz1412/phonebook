Rails.application.routes.draw do
  devise_for :users

  resources :contacts do
  	resources :phones, only:[:index, :create, :destroy]
  	resources :alamats, only:[:index, :create, :destroy]
  end

  root to: 'phonebook#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
