Rails.application.routes.draw do
  resource :users, only: [:index, :show, :new, :create, :edit, :update]
            post "/login", to: "users#login"
            get "/auto_login", to: "users#auto_login"
            put "/users/:id", to: "users#update"
end
