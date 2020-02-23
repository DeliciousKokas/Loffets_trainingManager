Rails.application.routes.draw do

  root to:'staticpages#home'

  get '/users/list', to:'pages#users'

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

  get '/users/:id/following', to:'relationships#following', as: :following_user
  get '/users/:id/followers', to:'relationships#followers', as: :followers_user

  resources :relationships, only: [:create, :destroy]

end
