Rails.application.routes.draw do
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/help", to: "static_pages#help"
  get "/contact", to: "static_pages#contact"
  namespace :admin do
    root "users#index"
    resources :users 
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
