Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # MAIN Home Routes
  root 'home#index'
  get '/', to: 'home#index'
  get '/upload', to: 'home#upload'
  post '/upload', to: 'home#upload'
  post '/view', to: 'home#view'

end

