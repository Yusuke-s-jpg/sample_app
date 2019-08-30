Rails.application.routes.draw do

  get "/" => "home#top"

  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"

  post "logout" => "users#logout"
  post "login" => "users#login"
  post "users/create" => "users#create"
  get "login" => "users#login_form"
  get "users/new" => "users#new"
  get "users/:id" => "users#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
