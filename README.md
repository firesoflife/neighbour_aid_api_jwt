# Rails API - Authenticatio with JWT

## Resources

Main Resource

- https://dev.to/alexmercedcoder/ruby-on-rails-api-with-jwt-auth-tutorial-go2

Crud Actions help

- https://betterprogramming.pub/the-beginners-guide-to-building-apps-with-react-hooks-and-a-rails-api-back-end-a414dade8e28

## Gems

- JWT -- `gem 'jwt'`
- Rack Cors -- `gem 'rack-cors'` (simply uncomment after spinning up Rails api
- bcrypt -- `gem 'bcyrpt', '~>3.1.7'` (simply uncomment after spinning up Rails api)

## Steps

1.  Uncomment the bcrypt and rack-cors gems and install the JWT gem
2.  Head to `config/initializers/cors.rb` and uncomment the cors configuration
3.  Create two routes in `config/routes.rb` and add resources for "Users"

        Rails.application.routes.draw do
            resource :users, only: [:create]
            post "/login", to: "users#login"
            get "/auto_login", to: "users#auto_login"
        end

4.  Generate a User model using the rails generator and all the user model criteria
5.  Add the bCrypt Macro to `app/models.user.rb`

        class User < ApplicationRecord
            has_secure_password
        end

6.  Generate the Users controller -- `rails g controller Users`
7.  migrate the database - `rails db:create` and `raills db:migrate`
8.  Enter some seed data for testing using Rails console or `seeds.rb`
9.  The big one -- build out the Application Controller to handle JWT in `app/controllers/application_controller.rb`
