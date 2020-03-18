Rails.application.routes.draw do
  concern :paginatable do
    get "(page/:page)", action: :index, on: :collection, as: ''
  end

  scope "(:locale)", locale: /en|vi/ do 
    root "static_pages#home"
    get "/about", to: "static_pages#about"
    get "/help", to: "static_pages#help"
    get "/contact", to: "static_pages#contact"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users
  end
  
  namespace :admin do
    root "users#index"
    resources :users, concerns: :paginatable
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
