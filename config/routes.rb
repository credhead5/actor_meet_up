Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/users" => "users#index"
    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    get "/meetings" => "meetings#index"
    get "/meetings/:id" => "meetings#show"
    post "/meetings" => "meetings#create"
    patch "/meetings/:id" => "meetings#update"
    delete "/meetings/:id" => "meetings#destroy"

    get "/reviews" => "reviews#index"
    get "/reviews/:id" => "reviews#show"
    post "/reviews" => "reviews#create"
    patch "/reviews/:id" => "reviews#update"
    delete "/reviews/:id" => "reviews#destroy"

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

  end
end
