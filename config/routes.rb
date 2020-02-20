Rails.application.routes.draw do

  root to:'staticpages#home'

  get '/main', to:'pages#main'
  post '/main', to:'pages#new_record'

  get '/events', to:'pages#events'
  post '/events', to:'pages#create'
  delete '/events', to:'pages#destroy'

  get '/feed', to:'pages#feed'

  get '/chart', to:'charts#show'

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

end
