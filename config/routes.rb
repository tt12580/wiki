Rails.application.routes.draw do
  get 'writings/new'
  get 'writings/show'
  get 'wikis/new'
  get 'wikis/show'
  get 'wenzhangs/new'
  get 'taxons/show'
  get 'taxons/new'
  get 'wenzhangs/show'

  namespace :admin do
    resources :notices
    resources :wenzhangs
    resources :taxons do
      resources :wenzhangs
    end
    resources :wikis do
      resources :writings
    end
    resources :writings
    get '/not', to: 'notices#not'
    get '/wz', to: 'wenzhangs#wz'
    get '/wi', to: 'wikis#wi'
    get '/tax', to: 'taxons#tax'
    get '/write', to: 'writings#write'
    root 'notices#index'
  end
  get 'notices/new'
  get 'notices/show'
  get '/event', to: 'notices#event'
  get '/more', to: 'notices#more'
  get '/list', to: 'notices#list'
  resources :notices
  resources :taxons do
    resources :wenzhangs
  end
  resources :wenzhangs
  resources :wikis
  resources :writings
  root 'notices#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
