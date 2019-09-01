Rails.application.routes.draw do

  get 'likes/create'
  get "/" => "home#top"

  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"

  post "logout" => "users#logout"
  post "login" => "users#login"
  post "users/create" => "users#create"
  get "login" => "users#login_form"
  get "users/new" => "users#new"
  get "users/:id" => "users#show"

  post "likes/create/:id" => "likes#create"
  post "likes/delete/:id" => "likes#delete"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
