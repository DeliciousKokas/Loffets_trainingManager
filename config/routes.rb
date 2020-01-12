Rails.application.routes.draw do

  get 'pages/main'
  get '/', to:'staticpages#home'
  get '/main', to:'pages#main'
  get '/events', to:'pages#events'
  post '/events', to:'pages#create'
  delete '/events', to:'pages#destroy'

  devise_for :users

end
