Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users

  resources :users do
    patch 'update_status', on: :member
    get 'updatestatusshow', on: :member
  end
  
  resources :compaigns do
    get 'search', on: :collection
    resources :comments, :to_dos, :tags
    resources :discussion_topics do
      resources :comments
    end
  end

  root "compaigns#index"
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
