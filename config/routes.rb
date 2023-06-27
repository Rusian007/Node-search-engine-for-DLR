Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "rules#index"
  post 'rules/query', to: 'rules#search', as: :search_query
  get 'rules/:id', to: 'rules#details'
  get 'upload', to:'rules#upload', as: :search_upload
  post 'upload', to: 'rules#upload'
  get 'reindex', to: 'rules#reindex'
  get 'info', to: 'rules#info'
  get 'context/:rule_id/:section_id', to: 'rules#context' , as: :context


  # Define API routes
  namespace :api do
    namespace :v1 do
      get '/index', to: 'search_api#hello'
      get '/search', to: 'search_api#search'
     
    end
  end

end
