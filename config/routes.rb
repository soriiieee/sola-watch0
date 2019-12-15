Rails.application.routes.draw do
  resources :calenders
  root to: 'home#index'
  resources :arcives
  resources :satelights
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
