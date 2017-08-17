Rails.application.routes.draw do
  resources :cocktails, except: [:edit, :update, :destroy]
  resources :doses, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
