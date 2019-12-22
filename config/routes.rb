Rails.application.routes.draw do
  root to: 'home#index'
  resources :calenders
  resources :satelights
  get 'nows', to: 'nows#index'
  get 'getimage', to: 'nows#getimage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
