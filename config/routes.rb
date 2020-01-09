Rails.application.routes.draw do

  get 'pages/main'
  get '/', to:'staticpages#home'
  get '/main', to:'pages#main'
  get '/events', to:'pages#events'

  devise_for :users

end
