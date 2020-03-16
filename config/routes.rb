Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do 
    root "static_pages#home"
    get "/about", to: "static_pages#about"
    get "/help", to: "static_pages#help"
    get "/contact", to: "static_pages#contact"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    resources :users
  end
  
  namespace :admin do
    root "users#index"
    resources :users 
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
