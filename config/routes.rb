Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/authors", to:"author#index"
  post "/authors", to:"author#create"
  put "/authors", to:"author#update"
  delete "/authors", to:"author#delete"

  get "/books", to:"book#index"
  post "/books", to:"book#create"
  put "/books", to:"book#update"
end
