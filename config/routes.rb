Rails.application.routes.draw do
  root to: 'home#index'
  
  #sola-nows
  resources :satelights
  get 'nows', to: 'nows#index'
  get 'getimage', to: 'nows#getimage' #all data download to up s3

  #sola-data
  get 'data',to: 'data#index'
  get 'data/show'

  #sola-calender
  resources :calenders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
