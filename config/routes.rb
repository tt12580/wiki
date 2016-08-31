Rails.application.routes.draw do
  get 'notices/new'

  get 'notices/show'
  get '/event', to: 'notices#event'
  get '/more', to: 'notices#more'
  get '/list', to: 'notices#list'
  get '/sanwen', to: 'notices#sanwen'
  get '/shige', to: 'notices#shige'
  get '/libai', to: 'notices#libai'
  get '/dufu', to: 'notices#dufu'
  get '/zawen', to: 'notices#zawen'
  get '/suibi', to: 'notices#suibi'
  get '/riji', to: 'notices#riji'
  get '/xxs', to: 'notices#xxs'
  get '/xqj', to: 'notices#xqj'
  resources :notices
  root 'notices#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
