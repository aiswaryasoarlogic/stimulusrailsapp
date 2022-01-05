Rails.application.routes.draw do
  resources :users
  # users_controller
  root "users#index"
  get "/", to: "users#index"
  post "/users", to: "users#create"
  get "/dashboard", to: "home#index"
  
  post "/update", to: "sessions#update"
  get "/createpage", to: "home#createpage"
  post "/sessions", to: "sessions#create"
  get "/admindashboard", to: "admin#admindashboard"
  get "/editadminprofile", to: "admin#editadminprofile"
  get "/adminsettings", to: "admin#adminsettings"
  get "/logout", to: "sessions#destroy"
  get "/adminlogout", to: "sessions#admindestroy"
  
  post "/admin", to: "admin#create"
  get "/subpage", to: "home#subpage"
  get "/admins", to: "admin#admins"
  get "/seo", to: "home#seo"
  get "/listpage", to: "home#listpage"
  get "/pagedata", to: "home#pagedata"
  get "/subpagedata", to: "home#subpagedata"
  post "/home", to: "home#create"
  get "/edit", to: "home#edit"
  get "/admin", to: "users#adminlogin"
  get "/userslist", to: "admin#userslist"
  post "/subpage", to: "home#createsubpage"
  post "/updatepage", to: "home#updatepage"
  post "/updatesubpage", to: "home#updatesubpage"
  post "/updateadminprofile", to: "admin#update"
  get "/deletepage", to: "home#deletepage"
  get "/userlogin", to: "users#userlogin"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "/adminprofile", to: "admin#adminprofile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
