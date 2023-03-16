Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "rules#index"
  post 'rules/query', to: 'rules#search', as: :search_query
  get 'rules/:id', to: 'rules#details'

end
